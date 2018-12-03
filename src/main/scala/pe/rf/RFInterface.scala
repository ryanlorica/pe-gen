package pe.rf

import chisel3._

class RFInterface(c: RFConfig) extends Bundle {

  override def cloneType: RFInterface.this.type =
    new RFInterface(c).asInstanceOf[this.type]

  val ctrl: RFControl = new RFControl(c)
  val dataIn: UInt = Input(UInt(c.dataWidth.W))
  val dataOut: UInt = Output(UInt(c.dataWidth.W))
}
