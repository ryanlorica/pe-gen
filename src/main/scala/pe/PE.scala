package pe

import chisel3._
import pe.act.ACT
import pe.mac.MAC
import pe.rf.RF

class PE(c: PEConfig) extends Module {
  val io: PEInterface = IO(new PEInterface(c))

  val weightRF = Module(new RF(c.weightRFConfig))
  weightRF.io.ctrl <> io.ctrl.weightRFCtrl
  weightRF.io.dataIn := io.weightIn

  val actvtnRF = Module(new RF(c.actvtnRFConfig))
  actvtnRF.io.ctrl <> io.ctrl.actvtnRFCtrl
  actvtnRF.io.dataIn := io.actvtnIn

  val mac = Module(new MAC(c.macConfig))
  mac.io.ctrl <> io.ctrl.macCtrl
  mac.io.weight := weightRF.io.dataOut
  mac.io.actvtn := actvtnRF.io.dataOut

  val intrnlRF = Module(new RF(c.intrnlRFConfig))
  intrnlRF.io.ctrl <> io.ctrl.intrnlRFCtrl
  intrnlRF.io.dataIn := mac.io.res
  mac.io.accuml := intrnlRF.io.dataOut

  val act = Module(new ACT(c.actConfig))
  act.io.ctrl <> io.ctrl.actCtrl
  act.io.input := intrnlRF.io.dataOut
  io.output := act.io.output
}
