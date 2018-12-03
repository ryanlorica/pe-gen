package pe.fp

import chisel3.util.HasBlackBoxResource
import pe.DataType

class ValExec_MulAddRecF8_add(dataType: DataType) extends HardfloatAdd(dataType) with HasBlackBoxResource {
  setResource("/ValExec_MulAddRecF8_add.v")
}