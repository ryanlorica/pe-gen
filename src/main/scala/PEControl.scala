import chisel3._

class PEControl(c: PEConfig) extends Bundle {
  val weightRFCtrl = new RFControl(c.weightRFConfig)
  val actvtnRFCtrl = new RFControl(c.actvtnRFConfig)
  val intrnlRFCtrl = new RFControl(c.intrnlRFConfig)
  val macCtrl = new MACControl(c.macConfig)
  val actCtrl = new ACTControl(c.actConfig)
}
