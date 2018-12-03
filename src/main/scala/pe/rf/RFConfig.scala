package pe.rf

import chisel3.util.log2Floor

case class RFConfig(memSize: Int, dataWidth: Int) {
  val addrWidth = log2Floor(memSize)
}
