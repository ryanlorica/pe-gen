package pe.mac

import chisel3._

import pe._
import pe.fp._

class MAC(c: MACConfig) extends Module {
  val io: MACInterface = IO(new MACInterface(c))

  private val fp: Boolean = c.dataType == INT8

  if (!fp) {
    when (io.ctrl.multEnable && io.ctrl.addEnable) {
      io.res := io.weight * io.actvtn + io.accuml
    } .elsewhen(io.ctrl.multEnable && !io.ctrl.addEnable) {
      io.res := io.weight * io.actvtn
    } .elsewhen(!io.ctrl.multEnable && io.ctrl.addEnable) {
      io.res := io.actvtn + io.accuml
    } .otherwise {
      io.res := io.accuml
    }
  } else {
    when (io.ctrl.multEnable && io.ctrl.addEnable) {
      io.res := FPAdd(c.dataType, io.accuml, FPMult(c.dataType, io.weight, io.actvtn))
    } .elsewhen(io.ctrl.multEnable && !io.ctrl.addEnable) {
      io.res := FPMult(c.dataType, io.weight, io.actvtn)
    } .elsewhen(!io.ctrl.multEnable && io.ctrl.addEnable) {
      io.res := FPAdd(c.dataType, io.actvtn, io.accuml)
    } .otherwise {
      io.res := io.accuml
    }
  }
}
