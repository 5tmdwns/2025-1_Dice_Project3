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

<table>
  <tr>
    <td>

``` verilog
...
wire [3:0] MAIN_SEG0, MAIN_SEG1, MAIN_SEG2, MAIN_SEG3;
wire [3:0] MAIN_SEG4, MAIN_SEG5, MAIN_SEG6, MAIN_SEG7;
```
      
    </td>
  </tr>
</table>


