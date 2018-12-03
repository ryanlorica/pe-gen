package pe.fp

import chisel3._

class FPAddIO(bitWidth: Int) extends Bundle {
  val in1 = Input(UInt(bitWidth.W))
  val in2 = Input(UInt(bitWidth.W))
  val out = Output(UInt(bitWidth.W))
}
