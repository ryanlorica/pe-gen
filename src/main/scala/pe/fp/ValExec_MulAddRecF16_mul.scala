package pe.fp

import chisel3.util.HasBlackBoxResource
import pe.DataType

class ValExec_MulAddRecF16_mul(dataType: DataType) extends HardfloatMult(dataType) with HasBlackBoxResource {
  setResource("/ValExec_MulAddRecF16_mul.v")
}
