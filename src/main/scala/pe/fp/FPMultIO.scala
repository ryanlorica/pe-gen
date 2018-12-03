package pe.fp

import chisel3._

class FPMultIO(bitWidth: Int) extends Bundle {

  override def cloneType: FPMultIO.this.type = new FPMultIO(bitWidth).asInstanceOf[this.type]

  val in1 = Input(UInt(bitWidth.W))
  val in2 = Input(UInt(bitWidth.W))
  val out = Output(UInt(bitWidth.W))
}
