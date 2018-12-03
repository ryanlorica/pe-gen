package pe.fp

import chisel3._
import chisel3.util._

import pe._

class FPMult(dataType: DataType) extends Module {

  val io: FPMultIO = IO(new FPMultIO(dataType.bitWidth))

  val hfMult: HardfloatMult = Module(dataType match {
    case FP8 => new ValExec_MulAddRecF8_mul(dataType)
    case FP16 => new ValExec_MulAddRecF16_mul(dataType)
    case FP32 => new ValExec_MulAddRecF32_mul(dataType)
    case BF16 => new ValExec_MulAddRecF16_mul(dataType)
  })


  hfMult.io.io_roundingMode := 0.U
  hfMult.io.io_detectTininess := 0.U
  hfMult.io.io_expected_out := 0.U
  hfMult.io.io_expected_exceptionFlags := 0.U

  hfMult.io.io_a := io.in1
  hfMult.io.io_b := io.in2
  io.out := hfMult.io.io_actual_out
}

object FPMult {
  def apply(dataType: DataType, a: UInt, b: UInt): UInt = {
    val mult = Module(new FPMult(dataType))
    mult.io.in1 := a
    mult.io.in2 := b
    mult.io.out
  }
}