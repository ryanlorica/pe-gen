import chisel3._

class ACTInterface(c: ACTConfig) extends Bundle {
  val ctrl: ACTControl = new ACTControl(c)
  val input = Input(UInt(c.dataType.bitWidth.W))
  val output = Output(UInt(c.dataType.bitWidth.W))
}
