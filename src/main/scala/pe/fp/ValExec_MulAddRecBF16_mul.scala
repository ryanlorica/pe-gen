package pe.fp

import chisel3.util._

import pe._

class ValExec_MulAddRecBF16_mul(dataType: DataType) extends HardfloatAdd(dataType) with HasBlackBoxResource {
  setResource("/ValExec_MulAddRecBF16_mul.v")
}
