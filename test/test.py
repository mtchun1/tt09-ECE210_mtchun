# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut.ui_in.value = 0x00
    dut.uio_in.value = 0x00
    await ClockCycles(dut.clk, 10)

    # NAND Gate Tests
    # dut.ui_in.value = 0x00
    # await ClockCycles(dut.clk, 30)
    # assert dut.uio_out.value == 128

    # dut.ui_in.value = 0x01
    # await ClockCycles(dut.clk, 30)
    # assert dut.uio_out.value == 128

    # dut.ui_in.value = 0x10
    # await ClockCycles(dut.clk, 30)
    # assert dut.uio_out.value == 128

    # dut.ui_in.value = 0x11
    # await ClockCycles(dut.clk, 30)
    # assert dut.uio_out.value == 0

    dut.ui_in.value = 0b00000011
    dut.uio_in.value = 0b00000011
    await ClockCycles(dut.clk, 100)
    dut.ui_in.value = 0b00000000
    await ClockCycles(dut.clk, 100)

    dut.log.info("Finished Test")