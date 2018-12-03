package pe.fp

import chisel3._
import chisel3.util._
import pe._

class FPMult(dataType: DataType) extends Module {

  private val bitWidth = dataType.bitWidth

  private class HardfloatMult(dataType: DataType) extends BlackBox with HasBlackBoxResource {
    val io = IO(new Bundle {
      val a = Input(UInt(bitWidth.W))
      val b = Input(UInt(bitWidth.W))
      val roundingMode = Input(UInt(3.W))
      val detectTininess = Input(Bool())
      val expected_out = Input(UInt(bitWidth.W))
      val expected_exceptionFlags = Input(UInt(5.W))
      val expected_recOut = Output(UInt((bitWidth + 1).W))
      val actual_out = Output(UInt((bitWidth + 1).W))
      val actual_exceptionFlags = Output(UInt(5.W))
      val check = Output(Bool())
      val pass = Output(Bool())
    })
    dataType match {
      case FP8 => setResource("/ValExec_MulAddRecF8_mul.v")
      case FP16 => setResource("/ValExec_MulAddRecF16_mul.v")
      case FP32 => setResource("/ValExec_MulAddRecF32_mul.v")
      case BF16 => setResource("/ValExec_MulAddRecBF16_mul.v")
    }
  }

  val io = IO(new Bundle {
    val in1 = Input(UInt(bitWidth.W))
    val in2 = Input(UInt(bitWidth.W))
    val out = Output(UInt(bitWidth.W))
  })

  val hfMult = Module(new HardfloatMult(dataType))
  hfMult.io.a := io.in1
  hfMult.io.b := io.in2
  io.out := hfMult.io.actual_out
}

object FPMult {
  def apply(dataType: DataType, a: UInt, b: UInt): UInt = {
    val mult = Module(new FPMult(dataType))
    mult.io.in1 := a
    mult.io.in2 := b
    mult.io.out
  }
}