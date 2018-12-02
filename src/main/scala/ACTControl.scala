import chisel3._

class ACTControl(c: ACTConfig) extends Bundle {
  val enable = Input(Bool())
}