package pe.fp

import chisel3._
import chisel3.util._
import pe._

class FPAdd(dataType: DataType) extends Module {

  private val bitWidth: Int = dataType.bitWidth

  private class HardfloatAdd(dataType: DataType) extends BlackBox with HasBlackBoxResource {
    val io = IO(new Bundle {
      val io_a = Input(UInt(bitWidth.W))
      val io_b = Input(UInt(bitWidth.W))
      val io_roundingMode = Input(UInt(3.W))
      val io_detectTininess = Input(Bool())
      val io_expected_out = Input(UInt(bitWidth.W))
      val io_expected_exceptionFlags = Input(UInt(5.W))
      val io_expected_recOut = Output(UInt((bitWidth + 1).W))
      val io_actual_out = Output(UInt((bitWidth + 1).W))
      val io_actual_exceptionFlags = Output(UInt(5.W))
      val io_check = Output(Bool())
      val io_pass = Output(Bool())
    })
    dataType match {
      case FP8 => setResource("/ValExec_MulAddRecF8_add.v")
      case FP16 => setResource("/ValExec_MulAddRecF16_add.v")
      case FP32 => setResource("/ValExec_MulAddRecF32_add.v")
      case BF16 => setResource("/ValExec_MulAddRecBF16_add.v")
    }
  }

  val io = IO(new Bundle {
    val in1 = Input(UInt(bitWidth.W))
    val in2 = Input(UInt(bitWidth.W))
    val out = Output(UInt(bitWidth.W))
  })

  val hfAdd = Module(new HardfloatAdd(dataType))
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