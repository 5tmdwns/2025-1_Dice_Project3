<p align="center">
  <h1 align="center">디지털 시계 RTL 기반 Synthesis 최적화✨</h1>
</p>

## Index ⭐️
- [1. Spec](#1-spec)
- [2. Block Diagram](#2-block-diagram)
- [3. PPA 향상을 위한 노력](#3-PPA-향상을-위한-노력)
- [4. Result](#4-Result)

## 1. Spec
- 8개의 세그먼트 : Day(31일 고정!), Hours(24시간), Min, Sec 형식
- 디버그를 위한 X100 Faster 기능
- Input Clock 1kHz에서 무한대까지 가능 (Performance를 위함!)
- Asynchronous Reset negative (`SW0`)
- Manual Timing Setting
  - 해당 모드 진입 (`SW1` On), KEY3 누를 시, 초 -> 분 -> 시간 -> 날짜 -> 초 순서로 이동
  - `KEY2`는 1씩 증가, `KEY1`은 1씩 감소
  - `SW1` Off 시, 표시되던 7세그먼트가 업데이트 되어서 정상 Digital Clock이 표시 되어야 함.
- Stop Watch
  - 해당 모드 진입 (`SW2` On), `KEY3` 누르면 시작, 다시 `KEY3` 누르면 정지, `SW2` Off 시 Reset
  - 이 기능은 Main Clock에 영향을 주면 안됨. 즉, Stop Watch Mode 일 때, Digital Clock은 동작 중이어야 함.
### Score (80 : Function - 72 : PPA Ranking - 20 : Presentation)
- 기본 기능 : 8개의 세그먼트 형식 + Manual Clock Setting + Stop Watch (각각의 기능에 대해 20pt), 각각의 추가 기능에 대해 5pt
- PPA : Power(24) vs Performance(24)(Min. Freq. 에서 모든 기능 동작!) vs Area(24)
- Presentation : Block Diagram + Utility + 3 Additional Specs.(15pt) + 발표 시간 10분 이내 (5pt)

## 2. Block Diagram
<p align="center">
  <img width="80%" alt="Block Diagram" src="https://github.com/user-attachments/assets/7af8c10c-60da-4520-8f22-6d0bd74e181c" />
</p>

## 3. PPA 향상을 위한 노력
&nbsp;초기 프로젝트1의 RTL코드를 두고 조원과 토론을 한 결과, 싱글 코너에서 Performance는 한 점으로 수렴하겠다라고 생각하여, Power와 Area에 방점을 두고 최적화를 진행하였습니다. <br/>
Dynamic Power 수식의 관점에서 보자면, <br/>

``` math
P_{d} = \alpha CV_{DD}^{2}f
```
- $\alpha$ : 회로의 Switching 활성율 (Performance vs Power)
- $C$ : 부하 Capacitance (Performance vs Power/Area)
- $V_{DD}$ : 동작 전압 (Performance vs Power)
- $f$ : Clock Frequency (Performance vs Power)

&nbsp;위와같이 $\alpha$가 커지면, Performance는 올라가나 Power도 같이 커지기 때문이고, $C$가 커진다는 것은 Cell Size를 키워 Drive Strength를 높여 Performance를 키우겠다는 소리인데, 이는 Performance vs Power/Area에 귀결됩니다. <br/>
또한, $V_{DD}$를 낮추면 그에 따른 Dynamic Power는 감소하겠지만, Switching 속도도 떨어져 Performance가 떨어질 것입니다. <br/>
이처럼, 해당 수식으로 Performance vs Power/Area 형태를 띄운다는 것을 확인하고, 전략을 Power와 Area 최적화에 방점을 찍었습니다. <br/>
Design Compiler로 Synthesis과정 진행 시, Performance는 1ns로 고정하고 마지막에 Testbench에 통과하면 서서히 SDC Main Clock Frequency를 풀어 최적화를 진행하였습니다.

### Version 1
&nbsp;우선 프로젝트1에서 조원과의 디지털시계 RTL 코드과 다르기 때문에, Design Compiler를 이용해 기본적인 `compile` 명령어로 Synthesis 결과를 비교하여 어떤 코드를 최적화할지 결정했습니다. <br/>
제 코드와 조원 코드의 결과를 비교한 사진입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 1 Schematic 1" src="https://github.com/user-attachments/assets/c145a7c1-9720-47b3-b6cc-8c4478b6e560" /></td>
    <td align="center"><img width="100%" alt="Version 1 Schematic 2" src="https://github.com/user-attachments/assets/e954c68d-27cc-47a7-89f5-a5eb07211220" /></td>
  </tr>
  <tr>
    <td align="center">
      
```
change_selection [get_pins -hier *] Schematic
```

  </td>
    <td align="center">

```
change_selection [get_pins -hier *] Schematic
```
      
  </td>
  </tr>
  <tr>
    <td align="center"><img width="100%" alt="Version 1 report_area 1" src="https://github.com/user-attachments/assets/eb638ce2-cdcd-4857-90f1-9a579d83596c" /></td>
    <td align="center"><img width="100%" alt="Version 1 report_area 2" src="https://github.com/user-attachments/assets/334de5c8-d84a-43f8-bff8-04eae55f8017" /></td>
  </tr>
  <tr>
    <td align="center">
      
```
report_area
```
  </td>
    <td align="center">

```
report_area
```

  </td>  
  </tr>
</table>

&nbsp;위의 `report_area` 결과에서 Area : 1330.61의 결과를 확인할 수 있었습니다. <br/>
이후, 더 줄일 방법이 없을까 생각하던 중, DC Shell `compile` 명령어의 옵션을 찾아봤습니다. <br/>

- `-gate_clock` : -gate_clock 옵션 사용 시, Clock Gating이 `set_clock_gating_style` 커맨드에 의해 디자인을 바라보며 적용됩니다. 또한 Scenarios에 무관하게 삽입됩니다.
- `-auto_ungroup area` : Area 기반으로 자동적으로 Hierarchies를 Ungroup 시켜줍니다.
- `-ungroup_all` : 현재 디자인 Hierarchy의 모든 Lower Levels을 제거합니다.

&nbsp;compile 옵션 중, `compile -gate_clock`, `compile -auto_ungroup area -gate_clock`, `compile -ungroup_all -gate_clock` 비교 후, Area측에서 이득을 보는 `compile -auto_ungroup area -gate_clock`을 사용하였습니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="version 1 compile" src="https://github.com/user-attachments/assets/a572d776-937b-4b99-81b0-016ca54b0880" /></td>
    <td align="center"><img width="100%" alt="version 1 compile -gate_clock" src="https://github.com/user-attachments/assets/46cf5994-0ad5-430e-a0ec-b8f62ef8ad62" /></td>
  </tr>
  <tr>
    <td align="center">

```
compile
```
      
  </td>
    <td align="center">

```
compile -gate_clock
```
      
  </td>
  </tr>
  <tr>
    <td align="center"><img width="100%" alt="version 1 compile -ungroup_all -gate_clock" src="https://github.com/user-attachments/assets/1adbdc83-fd0d-4648-bc12-45fa77588c40" /></td>
    <td align="center"><img width="100%" alt="version1 compile -auto_ungroup area -gate_clock" src="https://github.com/user-attachments/assets/410a8598-926c-4200-820e-e45501d54d55" /></td>
  </tr>
  <tr>
    <td align="center">

```
compile -ungroup_all -gate_clock
```
      
  </td> 
  <td>

```
compile -auto_ungroup area -gate_clock
```
  
  </td>
  </tr>
</table>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">87.55uW</td>
    <td align="center">1157.73</td>
  </tr>
</table>

### Version 2
#### Case문 카르노맵을 이용한 Boolean Equation
&nbsp; 우선, 면적을 줄일 곳을 찾다가, 4-to-7 Decoder에서 Case문의 Default부분을 Don't Care처리해서 다음과 같은 Boolean Equation으로 변경하였습니다. <br/>

<table align="center">
  <tr>
    <td>

``` verilog
module DECODE7SEG(/*AUTOARG*/
            // Outputs
            OUT,
            // Inputs
            IN
            );
  input [3:0] IN;
  output reg [6:0] OUT;
  // Internal signal declarations

  // Combinational logic
  always @(*) begin
    case (IN)
  4'h0 : OUT = 7'b1000000;
  4'h1 : OUT = 7'b1111001;
  4'h2 : OUT = 7'b0100100;
  4'h3 : OUT = 7'b0110000;
  4'h4 : OUT = 7'b0011001;
  4'h5 : OUT = 7'b0010010;
  4'h6 : OUT = 7'b0000010;
  4'h7 : OUT = 7'b1111000;
  4'h8 : OUT = 7'b0000000;
  4'h9 : OUT = 7'b0010000;
  default : OUT = 7'b1111111;
    endcase
  end
endmodule
```

  </td>
  <td>

``` verilog
module DECODE7SEG(/*AUTOARG*/
          // Outputs
          OUT,
          // Inputs
          IN
          );
  input [3:0] IN;
  output [6:0] OUT;

  wire         i3 = IN[3];
  wire         i2 = IN[2];
  wire         i1 = IN[1];
  wire         i0 = IN[0];

  wire         w012 = i0 & i1 & i2;
  wire         w_n1n2n3 = ~i1 & ~i2 & ~i3;

  assign OUT[6] = w012 | w_n1n2n3;
  assign OUT[5] = (i0 & i1) | (i1 & ~i2) | (i0 & ~i2 & ~i3);
  assign OUT[4] = i0 | (i2 & ~i1);
  assign OUT[3] = w012 | (i2 & ~i0 & ~i1) | (i0 & ~i1 & ~i2 & ~i3);
  assign OUT[2] = i1 & ~i0 & ~i2;
  assign OUT[1] = (i0 & i2 & ~i1) | (i1 & i2 & ~i0);
  assign OUT[0] = (i2 & ~i0 & ~i1) | (i0 & ~i1 & ~i2 & ~i3);

endmodule
```

  </td>
  </tr>
</table>

&nbsp;변경 후, DECODE7SEG의 Synthesis 이후의 Schematic을 비교하고, Hierarchical Cell Area의 결과를 비교해봤습니다. <br/>
<table align="center">
  <tr>
    <td align="center"><img width="60%" alt="Version 1. DECODE7SEG Schematic" src="https://github.com/user-attachments/assets/89b3f526-8cbf-4509-a12f-8a6d273b7017" /></td>
    <td align="center"><img width="60%" alt="Version 2. DECODE7SEG Schematic" src="https://github.com/user-attachments/assets/9eab810c-5939-48b6-944c-0fc4574dff34" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Version 1. DECODE7SEG</strong></td>
    <td align="center"><strong>Version 2. DECODE7SEG</strong></td>
  </tr>
</table>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 1. DECODE7SEG Hierarchical Cell Area" src="https://github.com/user-attachments/assets/f114a8a2-6786-4f3b-a058-fa065c96f4bd" /></td>
    <td align="center"><img width="100%" alt="Version 2. DECODE7SEG Hierarchical Cell Area" src="https://github.com/user-attachments/assets/b63d5acb-e69d-4909-8a41-4447108c80be" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Version 1. DECODE7SEG Hierarchical Cell Area</strong></td>
    <td align="center"><strong>Version 2. DECODE7SEG Hierarchical Cell Area</strong></td>
  </tr>
</table>

&nbps;Global Cell Area가 각 Cell 마당 2.22정도 줄어들었습니다. <br/>
이후, `reaport_area`와 `report_power`의 결과는 다음과 같습니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 2. report_area" src="https://github.com/user-attachments/assets/976d0b57-0eef-406b-959d-a379d8553c6f" /></td>
    <td align="center"><img width="100%" alt="Version 2. report_power" src="https://github.com/user-attachments/assets/37985b66-8e5f-4b4d-9e21-a1dc2a00a7b2" /></td>
  </tr>
  <tr>
    <td align="center">
      
```
report_area
```
  
  </td>
    <td align="center">

```
report_power
```      

  </td>
  </tr>
</table>

&nbsp;Version 1 -> Version 2로의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">87.55uW -> 76.24uW</td>
    <td align="center">1157.73 -> 1098.90</td>
  </tr>
</table>

### Version 3
&nbsp; 곰곰히 생각해보니, 날짜/시/분/초의 십의자리는 최대 5까지밖에 표현하지 않으니까 3 Bit만 사용해도 되어서 그에 따른 Register도 줄이겠다고 생각했습니다. <br/>
이후, 해당하는 3 Bit에 대한 3 Input DECODE7SEG Boolean Equation Combinational Logic을 또 만들어 주었습니다. <br/>
그리고, 디바운스 모듈에 사용되는 Register를 간소화하고, SW에서 Output Port까지 Combinational Logic이 길어 발생하는 Setup Timing Violation을 잡기 위해, TOP에서 Register를 삽입하여 Pipelining을 하였습니다. <br/>

<table align="center">
  <tr>
    <td>

``` verilog
...
// DIGITALCLOCK
wire [3:0] MAIN_SEG0, MAIN_SEG1, MAIN_SEG2, MAIN_SEG3;
wire [3:0] MAIN_SEG4, MAIN_SEG5, MAIN_SEG6, MAIN_SEG7;

// STOPWATCH
wire [3:0] SUB_SEG0, SUB_SEG1, SUB_SEG2, SUB_SEG3;
wire [3:0] SUB_SEG4, SUB_SEG5, SUB_SEG6, SUB_SEG7;

// SEG_CLOCK (, SEG_ALARM)
wire [3:0] SET_SEC0, SET_SEC1, SET_MIN0, SET_MIN1;
wire [3:0] SET_HOUR0, SET_HOUR1, SET_DATE0, SET_DATE1;
...
```
      
  </td>
  <td>

``` verilog
...
// DIGITALCLOCK
wire [3:0] MAIN_SEG0;
wire [2:0] MAIN_SEG1;
wire [3:0] MAIN_SEG2;
wire [2:0] MAIN_SEG3;
wire [3:0] MAIN_SEG4;
wire [2:0] MAIN_SEG5;
wire [3:0] MAIN_SEG6;
wire [2:0] MAIN_SEG7;

// STOPWATCH
wire [3:0] SUB_SEG0;
wire [2:0] SUB_SEG1;
wire [3:0] SUB_SEG2;
wire [2:0] SUB_SEG3;
wire [3:0] SUB_SEG4;
wire [2:0] SUB_SEG5;
wire [3:0] SUB_SEG6;
wire [2:0] SUB_SEG7;

// SET_CLOCK (,SET_ALARM)
wire [3:0] SET_SEC0;
wire [2:0] SET_SEC1;
wire [3:0] SET_MIN0;
wire [2:0] SET_MIN1;
wire [3:0] SET_HOUR0;
wire [2:0] SET_HOUR1;
wire [3:0] SET_DAY0;
wire [2:0] SET_DAY1;
...
```    
  </td>
  </tr>
  <tr>
    <td align="center" colspan="2"><strong>십의자리 3bit 사용</strong></td>
  </tr>
</table>

<table align="center">
  <tr>
    <td>

``` verilog
module DECODE7SEG1(/*AUTOARG*/
          // Outputs
          OUT,
          // Inputs
          IN
          );
  input [2:0] IN;
  output [6:0] OUT;

  wire     i2 = IN[2];
  wire     i1 = IN[1];
  wire     i0 = IN[0];

  assign OUT[6] = (~i2 & ~i1) | (i2 & i1 & i0);
  assign OUT[5] = (~i2 & (i1 | i0)) | (i2 & i1 & i0);
  assign OUT[4] = i0 | (i2 & ~i1 & ~i0);
  assign OUT[3] = (~i2 & ~i1 & i0) | (i2 & ~i1 & ~i0);
  assign OUT[2] = (~i2 & i1 & ~i0);
  assign OUT[1] = i2 & (i1 ^ i0);
  assign OUT[0] = ~i1 & (i2 ^ i0);

endmodule
```
      
  </td>
    <td>
      
``` verilog
...
  wire     SW1_DB = &SW1_shift;
  wire     SW2_DB = &SW2_shift;
  wire     SW3_DB = &SW3_shift;

  wire     prev_SW2 = SW_shift[2];

  // SW pipelining
  always @(posedge CLK100 or negedge RSTN) begin
      if (!RSTN) begin
    SW1_shift <= 3'd0;
    SW2_shift <= 3'd0;
    SW3_shift <= 1'd0;
      end
      else begin
    SW1_shift <= {SW1_shift[1:0], SW1};
    SW2_shift <= {SW2_shift[1:0], SW2};
    SW3_shift <= {SW3_shift[1:0], SW3};
      end
  end
...
```
      
  </td>
  </tr>
  <tr>
    <td align="center"><strong>3 Input DECODE7SEG</strong></td>
    <td align="center"><strong>Debounce 처리 Pipelining</strong></td>
  </tr>
</table>

&nbsp;Synthesis 이후, 해당 코드들의 Schematic을 Design Vision으로 봤습니다. <br/>
다음은 Version 2와의 비교 사진 입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 2. DECODE7SEG Schematic" src="https://github.com/user-attachments/assets/b867789f-9247-4131-92e0-ca36105b7cf3" /></td>
    <td align="center"><img width="100%" alt="Version 3. DECODE7SEG Schematic" src="https://github.com/user-attachments/assets/5347a6b1-de3a-4b68-864a-0d306fbf7636" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Version 2. DECODE7SEG</strong></td>
    <td align="center"><strong>Version 3. DECODE7SEG</strong></td>
  </tr>
  <tr>
    <td align="center"><img width="100%" alt="Version 2. Debouncing" src="https://github.com/user-attachments/assets/c46a8029-c7fe-4d9f-8d3f-49de8421f76a" /></td>
    <td align="center"><img width="100%" alt="Version 3. Debouncing" src="https://github.com/user-attachments/assets/2709d390-2714-4514-886b-1788228d72d8" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Version 2. Debouncing</strong></td>
    <td align="center"><strong>Version 3. Debouncing</strong></td>
  </tr>
</table>

&nbsp;다음은 `report_area`와 `report_power`의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 3. report_area" src="https://github.com/user-attachments/assets/a08d31cd-b7f2-46a0-a6a1-569a098697f3" /></td>
    <td align="center"><img width="100%" alt="Version 3. report_power" src="https://github.com/user-attachments/assets/251b8d14-1720-41e5-8f76-de9632358a0d" /></td>
  </tr>
  <tr>
    <td align="center">

```
report_area
```
      
  </td>
    <td align="center">

```
report_power
```
      
  </td>  
  </tr>
</table>


&nbsp;Version 2 -> Version 3로의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">76.24uW -> 49.63uW</td>
    <td align="center">1098.90 -> 918.37</td>
  </tr>
</table>

### Version 4
&nbsp; 초/분/시/날짜 중, 시/날짜의 십의자리는 3까지 사용하니깐, Register 2 Bit만 사용하고 그에 따른 DECODE7SEG 2Input을 만들어서 사용했습니다. <br/>

<table align="center">
  <tr>
    <td>

``` verilog
...
// DIGITALCLOCK
wire [3:0] MAIN_SEG0;
wire [2:0] MAIN_SEG1;
wire [3:0] MAIN_SEG2;
wire [2:0] MAIN_SEG3;
wire [3:0] MAIN_SEG4;
wire [2:0] MAIN_SEG5;
wire [3:0] MAIN_SEG6;
wire [2:0] MAIN_SEG7;

// STOPWATCH
wire [3:0] SUB_SEG0;
wire [2:0] SUB_SEG1;
wire [3:0] SUB_SEG2;
wire [2:0] SUB_SEG3;
wire [3:0] SUB_SEG4;
wire [2:0] SUB_SEG5;
wire [3:0] SUB_SEG6;
wire [2:0] SUB_SEG7;

// SET_CLOCK (,SET_ALARM)
wire [3:0] SET_SEC0;
wire [2:0] SET_SEC1;
wire [3:0] SET_MIN0;
wire [2:0] SET_MIN1;
wire [3:0] SET_HOUR0;
wire [2:0] SET_HOUR1;
wire [3:0] SET_DAY0;
wire [2:0] SET_DAY1;
...
```    
  </td>
  <td>

``` verilog
...
// DIGITALCLOCK
wire [3:0] MAIN_SEG0;
wire [2:0] MAIN_SEG1;
wire [3:0] MAIN_SEG2;
wire [2:0] MAIN_SEG3;
wire [3:0] MAIN_SEG4;
wire [1:0] MAIN_SEG5;
wire [3:0] MAIN_SEG6;
wire [1:0] MAIN_SEG7;

// STOPWATCH
wire [3:0] SUB_SEG0;
wire [2:0] SUB_SEG1;
wire [3:0] SUB_SEG2;
wire [2:0] SUB_SEG3;
wire [3:0] SUB_SEG4;
wire [1:0] SUB_SEG5;
wire [3:0] SUB_SEG6;
wire [1:0] SUB_SEG7;

// SET_CLOCK (,SET_ALARM)
wire [3:0] SET_SEC0;
wire [2:0] SET_SEC1;
wire [3:0] SET_MIN0;
wire [2:0] SET_MIN1;
wire [3:0] SET_HOUR0;
wire [1:0] SET_HOUR1;
wire [3:0] SET_DAY0;
wire [1:0] SET_DAY1;
...
```    
  </td>
  </tr>
  <tr>
    <td align="center" colspan="2"><strong>시간/날짜의 십의자리 2bit 사용</strong></td>
  </tr>
</table>

<table align="center">
  <tr>
    <td>

``` verilog
module DECODE7SEG_2IN(/*AUTOARG*/
              // Outputs
              OUT,
              // Inputs
              IN
              );

  input [1:0] IN;
  output [6:0] OUT;

  wire       i1 = IN[1];
  wire       i0 = IN[0];

  assign OUT[6] = ~i1;
  assign OUT[5] = i1 | i0;
  assign OUT[4] = i0;
  assign OUT[3] = ~i1 & i0;
  assign OUT[2] = i1 & ~i0;
  assign OUT[1] = 1'b0;
  assign OUT[0] = ~i1 & i0;

endmodule
```
      
    </td>
  </tr>
  <tr>
    <td align="center"><strong>2 Input DECODE7SEG</strong></td>
  </tr>
</table>

&nbsp; Synthesis 이후, 이전과 마찬가지로 DCODE7SEG 부분의 Schematic을 비교했습니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 3. DECODE7SEG" src="https://github.com/user-attachments/assets/20625814-47a6-45e8-8937-0d2c41f59ac4" /></td>
    <td align="center"><img width="100%" alt="Version 4. DECODE7SEG" src="https://github.com/user-attachments/assets/6b6a4096-976a-4292-987e-9e5acba2a8f5" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Version 3. DECODE7SEG</strong></td>
    <td align="center"><strong>Version 4. DECODE7SEG</strong></td>
  </tr>
</table>

&nbsp;다음은 `report_area`와 `report_power`의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 4. report_area" src="https://github.com/user-attachments/assets/8545d338-ab78-4f6c-bcfc-54bef6f899ba" /></td>
    <td align="center"><img width="100%" alt="Version 4. report_power" src="https://github.com/user-attachments/assets/a49d4e48-0717-407a-9171-dc4d65e68f2c" /></td>
  </tr>
  <tr>
    <td align="center">

```
report_area
```
      
  </td>
    <td align="center">

```
report_power
```
      
  </td>  
  </tr>
</table>

&nbsp;Version 3 -> Version 4로의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">49.63uW -> 41.72uW</td>
    <td align="center">918.37 -> 789.58</td>
  </tr>
</table>

### Version 5

&nbsp; 이제 Combinational Logic만 줄이다 보니까, Register를 줄이는 것이 훨씬 더 면적이 줄어드는 것을 체감했습니다. <br/>
영혼까지 Comb를 줄여서 더 이상 줄일 것이 없었습니다. <br/>
그래서, 현재 시간을 BCD 카운터를 통해 DECODE7SEG로 Input을 보내고 있었는데, 해당 BCD 카운터를 Binary 카운터로 변경하는 것이 더 Register를 적게 잡아 먹을거라 생각하고 수정했습니다. <br/>
그리고, Binary로 센 수를 BCD에 맞춰서 넣기위한 로직을 나눗셈 연산대신 BIN2BCD 모듈로 제작했습니다. <br/>

<table align="center">
  <tr>
    <td>

``` verilog
...
wire [3:0] seg_sec0;
wire [2:0] seg_sec1;
wire [3:0] seg_min0;
wire [2:0] seg_min1;
wire [3:0] seg_hour0;
wire [1:0] seg_hour1;
wire [3:0] seg_date0;
wire [1:0] seg_date1;
...
```
      
  </td>
    <td>

``` verilog
...
if(SECOND < 6'd59) SECOND <= SECOND + 6'd1;
else begin
  SECOND <= 6'd0;
  if(MINUTE < 6'd59) MINUTE <= MINUTE + 6'd1;
  else begin
    MINUTE <= 6'd0;
    if(HOUR < 5'd23) HOUR <= HOUR + 5'd1;
    else begin
      HOUR <= 5'd0;
      if(DATE < 5'd31) DATE <= DATE + 5'd1;
      else DATE <= 5'd1;
        end
...
```
    
  </td>
  </tr>
  <tr>
    <td align="center" colspan="2"><strong>BCD 카운터 -> Binary 카운터</strong></td>
  </tr>
</table>

<table align="center">
  <tr>
    <td>

``` verilog
module BIN2BCD_HOUR_DATE(/*AUTOARG*/
            // Outputs
            TENS, UNITS,
            // Inputs
            VALUE
            );
  input [4:0] VALUE;
  output [1:0] TENS;
  output [3:0] UNITS;

  reg [3:0] t, u;
  integer i;

  always @(*) begin
      t = 4'd0;
      u = 4'd0;
      for (i = 4; i >= 0; i - 1) begin
        if (u[3] | (u[2] & (u[1] | u[0]))) u = u + 4'd3;
        {t, u} = {t, u, VALUE[i]};
      end
  end

  assign TENS = t[1:0];
  assign UNITS = u;

endmodule
```
      
  </td>
  </tr>
  <tr>
    <td align="center"><strong>BIN2BCD Module</strong></td>
  </tr>
</table>

&nbsp;위 모듈은 비트 Binary 입력(`VALUE[4:0]`) → 2자리 BCD(`TENS`, `UNITS`)로 변환시키는 모듈 입니다. <br/>
예를 들어 `VALUE = 5'b10110(=22)`이라면, `TENS = 2`, `UNITS = 2` 처럼, 10진수 십의 자리/일의 자리로 변환해줍니다. <br/>
Double Dabble Algorithm (Shift-Add-3) BCD 변환 전용 알고리즘을 사용하여, 다음 두 동작을 반복하게 합니다. <br/>
  1. 각 BCD Digit이 5 이상이면 +3
  2. 왼쪽으로 1비트 Shift하면서 새 Binary 비트를 넣음
이 과정을 반복하면 Binary → BCD 변환이 완성됩니다. <br/>

&nbsp;해당 카운터 변경의 Schematic 비교는 다음과 같습니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 5. BCD Counter Schematic" src="https://github.com/user-attachments/assets/c9073886-defe-464c-bd95-e0a35d2dcdcc" /></td>
    <td align="center"><img width="100%" alt="Version 5. Binary Counter Schematic" src="https://github.com/user-attachments/assets/df9b71f2-dc6b-4dbe-b023-7d8476872c2d" /></td>
  </tr>
  <tr>
    <td align="center"><strong>BCD Counter Schematic</strong></td>
    <td align="center"><strong>Binary Counter Schematic</strong></td>
  </tr>
</table>

&nbsp;다음은 `report_area`와 `report_power`의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 5. report_area" src="https://github.com/user-attachments/assets/bd046498-3c30-4f42-88dc-04fe938961f4" /></td>
    <td align="center"><img width="100%" alt="Version 5. report_power" src="https://github.com/user-attachments/assets/27963294-3545-44b3-b481-e1940413bef1" /></td>
  </tr>
  <tr>
    <td align="center">

```
report_area
```
      
  </td>
    <td align="center">

```
report_power
```
      
  </td>  
  </tr>
</table>

&nbsp;Version 4 -> Version 5로의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">41.72uW -> 35.52uW</td>
    <td align="center">789.58 -> 756.45</td>
  </tr>
</table>

### Version 6
&nbsp; 이번에는 DIGITALCLOCK 모듈과 SET_CLOCK 모듈을 일원화 했습니다. <br/>
어차피, Manual Setting Mode로 시간을 변경하면, DIGITALCLOCK의 기본 동작 시간이 바뀌기 때문에 DIGITALCLOCK 안으로 넣어도 될 것 같다고 생각했습니다. <br/>
따라서 SET_CLOCK의 기존 모듈을 그대로 DIGITALCLOCK 모듈안으로 넣고, DIGITALCLOCK 모듈에 작성한 Register를 이용하여 해당 기능을 DIGITALCLOCK 모듈 안에서 구현했습니다. <br/>
구현하고 Synthesis 후, 각각의 Schematic을 분석한 결과 입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 6. DIGITALCLOCK & SET_CLOCK Schematic" src="https://github.com/user-attachments/assets/245502cf-6621-4e08-949e-6a6eb273eb6a" /></td>
    <td align="center"><img width="100%" alt="Version 6. DIGITALCLOCK Schematic" src="https://github.com/user-attachments/assets/6fe28629-b020-4921-bcb7-5593bf3465ae" />
</td>
  </tr>
  <tr>
    <td align="center"><strong>DIGITALCLOCK과 SET_CLOCK의 Schematic</strong></td>
    <td align="center"><strong>DIGITALCLOCK 일원화 Schematic</strong></td>
  </tr>
</table>

&nbsp;다음은 `report_area`와 `report_power`의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Version 6. report_area" src="https://github.com/user-attachments/assets/8e0a50cd-5edd-42ee-ada0-e231f8beaf61" /></td>
    <td align="center"><img width="100%" alt="Version 6. report_power" src="https://github.com/user-attachments/assets/e629d9e2-4d1e-413c-b57c-089a0bac10d4" /></td>
  </tr>
  <tr>
    <td align="center">

```
report_area
```
      
  </td>
    <td align="center">

```
report_power
```
      
  </td>  
  </tr>
</table>

&nbsp;Version 5 -> Version 6로의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">35.52uW -> 36.27uW</td>
    <td align="center">756.45 -> 605.42</td>
  </tr>
</table>

### Final
&nbsp; Single Main Clock을 사용하다가, 결국 Generated Clock을 사용했습니다...😂 <br/>
사실 쓰지 않을려고 했지만, 토글량이 다르기 때문에, 다른 조와 비교하여 Power와 Area 측면에서는 꼭 이점을 가져가야 했습니다... <br/>
그래서, 100HZ Clock을 같은 도메인 Main Clock으로 부터 생성시키기 위해 SDC를 다음과 같이 작성했습니다. <br/>

``` shell
create_generated_clock -name "CLK1KX10" -divide_by 10 -source [get_ports CLK1K] [get_pins gen_clock/CLK100_reg/Q]
```

Synthesis 이후, Schematic으로 해당 부분으로 Generated Clock이 생성되었습니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Final. Schematic" src="https://github.com/user-attachments/assets/8877d152-6cc2-4f7b-b34c-1b184327fb32" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Fianl Schematic</strong></td>
  </tr>
</table>

&nbsp;아직도, 1ns에서의 SDC를 작성하고 있기 때문에, 해당 1ns의 `report_area`와 `report_power`의 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Final. report_area" src="https://github.com/user-attachments/assets/21753113-f7f2-41bc-81a1-022bf9888e0e" /></td>
    <td align="center"><img width="100%" alt="Final. report_power" src="https://github.com/user-attachments/assets/1f0298ff-477d-45e6-84d3-1cb68f17bb55" /></td>
  </tr>
  <tr>
    <td align="center">

```
report_area
```
      
  </td>
    <td align="center">

```
report_power
```
      
  </td>  
  </tr>
</table>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">36.27uW -> 14.14uW</td>
    <td align="center">605.42 -> 548.41</td>
  </tr>
</table>

&nbsp;이제, 3ns로 다시 풀어서 `report_area`, `report_power`한 결과입니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Final. 3ns report_area" src="https://github.com/user-attachments/assets/0fb45eb1-4e92-46c3-a356-3b893acee25f" /></td>
    <td align="center"><img width="100%" alt="Final. 3ns report_power" src="https://github.com/user-attachments/assets/dc762b16-d5bd-405e-bf41-5e91440eb002" /></td>
  </tr>
  <tr>
    <td align="center">

```
report_area
```
      
  </td>
    <td align="center">

```
report_power
```
      
  </td>  
  </tr>
</table>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">3ns</td>
    <td align="center">14.14uW -> 5.85uW</td>
    <td align="center">548.41 -> 548.82</td>
  </tr>
</table>

## 4. Result
&nbsp;결론적으로 다음과 같은 Spec을 지닌 디지털시계를 설계했습니다. <br/>

<table align="center">
  <tr>
    <td align="center"><strong>Performance</strong></td>
    <td align="center"><strong>Power</strong></td>
    <td align="center"><strong>Area</strong></td>
  </tr>
  <tr>
    <td align="center">3ns</td>
    <td align="center">5.85uW</td>
    <td align="center">548.82</td>
  </tr>
</table>

&nbsp;Testbench에서의 All-Pass는 물론 `TCK`, `ASYNCDEL`과 총 Total Time은 다음과 같습니다. <br/>

<table align="center">
  <tr>
    <td align="center"><img width="100%" alt="Testbench Spec" src="https://github.com/user-attachments/assets/fa9e147b-73af-405b-8bf2-99c79c648bbc" /></td>
    <td align="center"><img width="100%" alt="Testbench Time" src="https://github.com/user-attachments/assets/cf41f8f9-02b8-4db8-9ded-47594fed5fbe" /></td>
  </tr>
  <tr>
    <td align="center">TCK, ASYNCDEL</td>
    <td align="center">Total Time</td>
  </tr>
</table>
