# ALARM-CLOCK (SVA)
# Alarm Clock Verification using SystemVerilog Assertions (SVA)

## Project Overview
This project focuses on the verification of an Alarm Clock RTL design using
SystemVerilog Assertions (SVA) and a UVM-based SystemVerilog verification
environment.
<img width="1520" height="1034" alt="image" src="https://github.com/user-attachments/assets/c1a172b1-74b4-41ec-819c-fa302dd81aaf" />

The verification environment checks alarm-clock functionality including
current-time operation, alarm behavior, display outputs and related FSM
behavior.

## Verification Objectives

- Verify alarm-clock functionality using a UVM-based testbench.
- Verify FSM behavior using SystemVerilog Assertions.
- Check current-time and alarm-time behavior.
- Verify alarm sound generation.
- Exercise different operating scenarios using multiple test cases.
- Measure assertion and coverage results using Synopsys VCS and URG.

## Test Cases

The regression contains three test cases:

| Test Case | Description |
|---|---|
| TC1 | `alarm_clock_rand_test` |
| TC2 | `alarm_clock_current_time_test` |
| TC3 | `alarm_clock_child_test` |

## Verification Environment

The testbench uses a UVM-based architecture consisting of components such as:

- UVM Test
- Environment
- IP Agent
- Display Agent
- Drivers
- Monitors
- Scoreboard
- Reference/expected-data generation
- SystemVerilog Assertions

### Verification Flow

text
Test
  ↓
UVM Environment
  ↓
 ┌───────────────┬────────────────┐
 │               │                │
IP Agent     Display Agent      SVA
 │               │                │
 └───────────────┴────────────────┘
                 ↓
              DUT
                 ↓
             Scoreboard
SystemVerilog Assertions

SVA assertions are bound to the FSM hierarchy of the Alarm Clock DUT.

The assertions are used to monitor FSM-related behavior and verify expected
relationships between control signals and state transitions.

## Tools Used
SystemVerilog
UVM
Synopsys VCS
Synopsys URG
Verdi
Linux
SystemVerilog Assertions (SVA)
Verification Results

The regression was executed using three test cases and coverage was merged
using Synopsys URG.

Metric	Result
Number of Tests	3
Overall URG Score	84.38%
Assertion Coverage	80.00%
Group Coverage	88.75%
DUV Coverage Score	85.71%
DUV Assertion Coverage	85.71%
Module Definition Coverage	80.00%
Coverage Report

The project generates an HTML coverage report using Synopsys URG.

The main report is available as:

urgReport/dashboard.html
🖥️ Coverage Dashboard

Add a screenshot of the URG coverage dashboard here.

📁 Project Structure
Alarm_Clock/
│
├── rtl/
│   └── RTL source files
<img width="1418" height="1109" alt="image" src="https://github.com/user-attachments/assets/06036161-9f72-4514-bf1f-14e87d667976" />

│
├── alarm_clock_env/
│   ├── top.sv
│   └── UVM environment files
│
├── alarm_clock_test/
│   ├── alarm_clock_pkg.sv
│   └── test files
│
├── alarm_clock_ip_agent/
│   └── IP agent components
│
├── alarm_clock_display_agent/
│   └── Display agent components
<img width="1897" height="829" alt="image" src="https://github.com/user-attachments/assets/dfbfd478-d9a3-4f2d-bee5-1f0b51694683" />


│<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/33c43658-3fc7-42ee-9f9a-946f86a9ab9b" />

├── alarm_clock_assertions/
│   └── fsm_assertions.sv
│
├── sim/
│   └── Makefile
│
└── README.md
🚀 Running the Regression

Compile and run the regression:

make regress

Generate the HTML coverage report:

make report

Open the coverage dashboard:

make cov

The HTML report is generated under:

urgReport/dashboard.html
📈 Verification Summary

The project demonstrates the use of UVM-based verification together with
SystemVerilog Assertions and coverage analysis for an RTL Alarm Clock design.

The regression covers multiple test scenarios and produces an HTML coverage
report using Synopsys URG.
