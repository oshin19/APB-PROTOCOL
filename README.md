# 🧠 APB Protocol Implementation using FSM (Finite State Machine)

This project presents a complete Verilog-based design of the **AMBA APB (Advanced Peripheral Bus) protocol**, implemented using a clearly structured Finite State Machine (FSM). The APB protocol is widely used in SoCs (System-on-Chip) for interfacing low-power peripherals.

---

## 📘 Project Objective

To implement the APB protocol in Verilog HDL using an FSM-based approach that handles both read and write operations, showcasing the protocol’s two-phase transfer mechanism (`SETUP` and `ACCESS`) along with proper handshaking using the `PREADY` signal.

---

## ⚙️ FSM Design

The core of the APB protocol implementation is a **3-state FSM** that controls signal transitions during each APB transaction.

### 🧾 States Description:
- **IDLE**: The bus is inactive; waiting for a valid transfer.
- **SETUP**: Master asserts `PSEL` with address and control signals.
- **ACCESS**: Master asserts `PENABLE` and waits for `PREADY` from slave to complete transfer.

### 🔁 FSM State Diagram:

![FSM Diagram](fsm.png)

The state machine transitions based on `PSEL`, `PENABLE`, `PWRITE`, and `PREADY`, ensuring correct timing behavior and protocol compliance.

---

## 📈 Waveform Diagram

This waveform shows a **write operation** where data is transferred from master to slave. The signals involved include `PCLK`, `PRESETn`, `PSEL`, `PWRITE`, `PENABLE`, `PADDR`, `PWDATA`, and `PREADY`.

![Waveform](waveform.png)

**Highlights:**
- `PSEL` and address/data are asserted in SETUP phase.
- `PENABLE` is asserted in ACCESS phase.
- `PREADY` determines when to complete the transfer and move back to IDLE or SETUP for next transaction.

---

## 📂 File Structure

| File Name     | Description                                |
|---------------|--------------------------------------------|
| `apb_fsm.v`   | APB protocol module implemented using FSM  |
| `apb_tb.v`    | Testbench to simulate APB protocol         |
| `fsm.png`     | FSM state diagram used for design reference|
| `waveform.png`| Waveform showing APB write cycle behavior  |
| `README.md`   | Project documentation and design overview  |

---

## 🧪 Simulation Instructions

You can simulate this Verilog design using open-source tools like **Icarus Verilog** and **GTKWave**:

```bash
# Compile the design
iverilog -o apb_fsm_tb apb_fsm.v apb_tb.v

# Run the simulation
vvp apb_fsm_tb

# View the waveform
gtkwave dump.vcd
