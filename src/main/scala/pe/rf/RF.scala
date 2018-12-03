package pe.rf

import chisel3._


class RF(c: RFConfig) extends Module {
  val io: RFInterface = IO(new RFInterface(c))

  val regs = RegInit(Vec(Seq.fill(c.memSize){0.U(c.dataWidth.W)}))

  when (io.ctrl.wEnable) {
    regs(io.ctrl.wAddr) := io.dataIn
  }

  when (io.ctrl.rEnable) {
    io.dataOut :=  regs(io.ctrl.rAddr)
  } .otherwise {
    io.dataOut := 0.U
  }
}
