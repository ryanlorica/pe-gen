package pe.fp

import chisel3.BlackBox
import chisel3.util.HasBlackBoxResource
import pe._

class HardfloatMult(dataType: DataType) extends BlackBox with HasBlackBoxResource {
  val io: HardfloatMultIO = IO(new HardfloatMultIO(dataType.bitWidth))
  dataType match {
    case FP8 => setResource("/ValExec_MulAddRecF8_mul.v")
    case FP16 => setResource("/ValExec_MulAddRecF16_mul.v")
    case FP32 => setResource("/ValExec_MulAddRecF32_mul.v")
    case BF16 => setResource("/ValExec_MulAddRecBF16_mul.v")
  }
}
