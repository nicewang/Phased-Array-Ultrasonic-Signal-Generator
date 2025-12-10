## Phased Array Ultrasonic Signal Generator
Bachelor's thesis at HHU in 2015, partly reorganized in 2025.
### Abstract
### 0. Hardware and Package Structure
* Hardware: Cyclone IV E (Altera)
* Package Structure:

```
${project_workspace}/
├── /
│   ├── 
│   └── /
│       ├── 
│       ├── 
│       ├── 
├── 
├── 
├── 
└── README.md               
```
### 1. Simplified Phased Array Ultrasound Signal Generator System
#### 1.1 Functional Block Diagram
![Functional Block Diagram of Simplified Phased Array Ultrasound Signal Generator System-1](assets/fig_1.png)

* `xkz_a` is the core generator module realized by VHDL/Verilog:
![Functional Block Diagram of Simplified Phased Array Ultrasound Signal Generator System-2](assets/fig_2.png)

#### 1.2 Simulation Diagram (Waveform)


### 2. Improved Phased Array Ultrasound Signal Generator System
#### 2.1 Functional Block Diagram
![Functional Block Diagram of Improved Phased Array Ultrasound Signal Generator System](assets/fig_3.png)

### 3. Peripheral Circuit Module Design
#### 3.1 Amplification Circuit
* Schematic Diagram of Adjustable Vcc Core Circuit:
![vcc_1](assets/vcc_1.png)
* Complete Schematic Diagram of Adjustable Vcc Circuit:
![vcc_2](assets/vcc_2.png)
* PCB Layout of Adjustable Vcc Circuit:
![vcc_pcb](assets/vcc_pcb.png)

### 4. Simulation Diagram (Waveform)
#### 4.1 Simplified Phased Array Ultrasound Signal Generator
* Phase Modulation Simulation Diagram (Pulse Width: 20ns):
![pm_20ns](assets/pm_20ns.png)
* Phase Modulation Simulation Diagram (Pulse Width: 80ns):
![pm_80ns](assets/pm_80ns.png)
* Phase Modulation Simulation Diagram (Pulse Width: 200ns):
![pm_200ns](assets/pm_200ns.png)
* Pulse Width Modulation Simulation Diagram (Phase Modulation Interval: 40ns):
![pwm_40ns](assets/pwm_40ns.png)
* Pulse Width Modulation Simulation Diagram (Phase Modulation Interval: 220ns):
![pm_220ns](assets/pwm_220ns.png)

#### 4.2 Improved Phased Array Ultrasound Signal Generator
### 5. Acoustic Experiments
#### 5.1 Physical Setup
![phy_setup_1](assets/phy_setup_1.png)
![phy_setup_2](assets/phy_setup_2.png)
#### 5.2 Acoustic Experiment Waveforms
* Pulse Transmitted by Transducer Excited by a Pulse with a Period of $500\mus$ and a Pulse Width of 200ns:
![exp_pm_500us_1](assets/exp_pm_500us_1.png)
![exp_pm_500us_2](assets/exp_pm_500us_2.png)
* Pulse Transmitted by Transducer Excited by a Pulse with a Period of 1ms and a Pulse Width of 200ns:
![exp_pm_1ms_1](assets/exp_pm_1ms_1.png)
![exp_pm_1ms_2](assets/exp_pm_1ms_2.png)