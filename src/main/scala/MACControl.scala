import chisel3._

class MACControl(c: MACConfig) extends Bundle {
  val multEnable: Bool = Input(Bool())
  val addEnable: Bool = Input(Bool())
}
