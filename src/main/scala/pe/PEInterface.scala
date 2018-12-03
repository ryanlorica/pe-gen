package pe

import chisel3._

class PEInterface(c: PEConfig) extends Bundle {

  override def cloneType: PEInterface.this.type =
    new PEInterface(c).asInstanceOf[this.type]

  val ctrl = new PEControl(c)
  val weightIn: UInt = Input(UInt(c.dataType.bitWidth.W))
  val actvtnIn: UInt = Input(UInt(c.dataType.bitWidth.W))
  val output: UInt = Output(UInt(c.dataType.bitWidth.W))
}
