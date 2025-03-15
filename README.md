# ATM System on Basys 3 FPGA

## About the Project
This project involves designing an ATM system that supports deposits and withdrawals with currency selection using switches. The system ensures that only one currency can be selected at a time and provides error indications for multiple currency selection, maximum balance reached, and minimum balance reached. The design is implemented in Verilog and deployed on the Basys 3 FPGA.

## Features
1. **Deposit and Withdrawal**:
   - Allows depositing and withdrawing one currency at a time.
   - Maximum balance of **255 Rs.** (8-bit).
   - Minimum and maximum balance indicators.

2. **Currency Selection**:
   - Users select a currency using DIP switches.
   - If multiple currencies are selected simultaneously, an error LED is activated.

3. **7-Segment Display Controller**:
   - Implements **"double dabble" algorithm** for 8-bit to BCD conversion.
   - Displays balance on **4-digit 7-segment displays**.

4. **Error Indicators**:
   - LED lights up when **max balance (255 Rs.)** is reached.
   - LED lights up when **min balance (0 Rs.)** is reached.
   - LED for **invalid multiple currency selection**.

5. **Debounce Mechanism**:
   - Push buttons for **reset, withdrawal, and deposit** are debounced to avoid unintended multiple presses.

6. **Clock and Counter**:
   - A slowed-down clock is used for display updates.
   - Counter and decoder implemented for 7-segment display control.

## Code Description
The Verilog implementation consists of modules for deposit/withdrawal logic, 7-segment display control, and debounce handling.

### Inputs
- **clk**: System clock.
- **reset**: Active-high reset to reset balance to zero.
- **deposit**: Push button to deposit the selected currency.
- **withdraw**: Push button to withdraw the selected currency.
- **currency_switches**: DIP switches to select the currency.

### Outputs
- **balance_display**: 4-digit 7-segment display showing the current balance.
- **max_balance_led**: LED indicating the balance has reached the maximum limit.
- **min_balance_led**: LED indicating the balance has reached the minimum limit.
- **multi_currency_error_led**: LED for multiple currency selection error.

## Simulation and Synthesis
- **Simulation**: Conducted using Vivado.
- **Synthesis**: Implemented on **Basys 3 FPGA** (Xilinx Artix-7).
- **Hardware Components**:
  - 4-digit 7-segment display.
  - DIP switches for currency selection.
  - Push buttons for deposit, withdrawal, and reset.
 

![Image](https://github.com/user-attachments/assets/9abe798c-e7c6-4195-8179-eca1ce081aaa)

![Image](https://github.com/user-attachments/assets/7ed7eee8-0771-4949-acb5-fa27fb9f8881)
