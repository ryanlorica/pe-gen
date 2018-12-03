package pe.mac

import chisel3._

class MACInterface(c: MACConfig) extends Bundle {

  override def cloneType: MACInterface.this.type =
    new MACInterface(c).asInstanceOf[this.type]

  val ctrl: MACControl = new MACControl(c)

  private val bitWidth: Int = c.dataType.bitWidth
  val weight: UInt = Input(UInt(bitWidth.W))
  val actvtn: UInt = Input(UInt(bitWidth.W))
  val accuml: UInt = Input(UInt(bitWidth.W))
  val res: UInt = Output(UInt(bitWidth.W))
}
