package pe

import chisel3._

class PEInterface(c: PEConfig) extends Bundle {
  val ctrl = new PEControl(c)
  val weightIn: UInt = UInt(c.dataType.bitWidth.W)
  val actvtnIn: UInt = UInt(c.dataType.bitWidth.W)
  val output: UInt = UInt(c.dataType.bitWidth.W)
}
