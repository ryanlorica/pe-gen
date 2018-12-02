import chisel3._
import chisel3.util.log2Floor

case class RFConfig(memSize: Int, dataWidth: Int) {
  val addrWidth = log2Floor(memSize)
}
