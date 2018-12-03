package pe.act

import chisel3._
import pe.fp.HardfloatMultIO

class ACTInterface(c: ACTConfig) extends Bundle {

  override def cloneType: ACTInterface.this.type =
    new ACTInterface(c).asInstanceOf[this.type]

  val ctrl: ACTControl = new ACTControl(c)
  val input = Input(UInt(c.dataType.bitWidth.W))
  val output = Output(UInt(c.dataType.bitWidth.W))
}
