package pe.rf

import chisel3._

class RFControl(c: RFConfig) extends Bundle {
  val rEnable: Bool = Input(Bool())
  val wEnable: Bool = Input(Bool())
  val rAddr: UInt = Input(UInt(c.addrWidth.W))
  val wAddr: UInt = Input(UInt(c.addrWidth.W))
}
