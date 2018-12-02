import chisel3._

class PE extends Module {
  val io = IO(new PEInterface)
}
