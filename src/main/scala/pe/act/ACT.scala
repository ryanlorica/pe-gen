package pe.act

import chisel3._

import pe.ReLU



class ACT(c: ACTConfig) extends Module {
  val io: ACTInterface = IO(new ACTInterface(c))
  c.functionType match {
    case ReLU => {
      when (io.ctrl.enable) {
        when (io.input.asSInt() < 0.S) {
          io.output := 0.S
        } .otherwise {
          io.output := io.input
        }
      }
    }
  }
}
