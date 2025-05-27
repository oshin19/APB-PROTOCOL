# APB Master-Slave Interface in Verilog

This project implements a basic AMBA APB (Advanced Peripheral Bus) Master-Slave communication protocol in Verilog.

## 🔧 Modules

- `apbmaster.v` : Master logic
- `apbslave.v`  : Dummy slave for APB protocol response
- `apb.v`       : Shared interface
- `apbtb.v`     : Testbench for simulating write and read transactions

## 📷 Waveform Example

![Waveform](waveform.png)


## 🧠 Concepts Covered

- FSM-based APB Master
- Write and Read transactions
- APB protocol signals: `paddr`, `pwdata`, `prdata`, `penable`, `psel`, etc.
- Testbench-driven simulation

---
