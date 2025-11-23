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
<table>
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

- `-gate_clock` : -gate_clock 옵션 사용 시, Clock Gating이 set_clock_gating_style 커맨드에 의해 디자인을 바라보며 적용됩니다. 또한 Scenarios에 무관하게 삽입됩니다.
- `-auto_ungroup area` : Area 기반으로 자동적으로 Hierarchies를 Ungroup 시켜줍니다.
- `-ungroup_all` : 현재 디자인 Hierarchy의 모든 Lower Levels을 제거합니다.

<table align="center">
  <tr>
    <td align="center"> Performance </td>
    <td align="center"> Power </td>
    <td align="center"> Area </td>
  </tr>
  <tr>
    <td align="center">1ns</td>
    <td align="center">87.55</td>
    <td align="center">1157.73</td>
  </tr>
</table>
