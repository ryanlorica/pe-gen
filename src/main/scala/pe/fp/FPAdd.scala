package pe.fp

import chisel3._
import chisel3.util._
import pe._

class FPAdd(dataType: DataType) extends Module {

  val io: FPAddIO = IO(new FPAddIO(dataType.bitWidth))

  val hfAdd: HardfloatAdd = Module(dataType match {
    case FP16 => new ValExec_MulAddRecF16_add(dataType)
    case FP32 => new ValExec_MulAddRecF32_add(dataType)
  })

  hfAdd.io.io_roundingMode := 0.U
  hfAdd.io.io_detectTininess := 0.U
  hfAdd.io.io_expected_out := 0.U
  hfAdd.io.io_expected_exceptionFlags := 0.U

  hfAdd.io.io_a := io.in1
  hfAdd.io.io_b := io.in2
  io.out := hfAdd.io.io_actual_out
}

object FPAdd {
  def apply(dataType: DataType, a: UInt, b: UInt): UInt = {
    val add = Module(new FPAdd(dataType))
    add.io.in1 := a
    add.io.in2 := b
    add.io.out
  }
}