import chisel3._


class RF(c: RFConfig) extends Module{
  val io: RFInterface = IO(new RFInterface(c))

  val regs = RegInit(Vec(Seq.fill(c.memSize){0.S(c.dataWidth.W)}))

  when (io.wEnable) {
    regs(io.wAddr) := io.dataIn
  }

  when (io.rEnable) {
    io.dataOut :=  regs(io.rAddr)
  } .otherwise {
    io.dataOut := 0.U
  }
}
