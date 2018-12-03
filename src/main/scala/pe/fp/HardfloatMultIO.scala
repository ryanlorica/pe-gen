package pe.fp

import chisel3._
import pe.DataType

class HardfloatMultIO(bitWidth: Int) extends Bundle {

  override def cloneType: HardfloatMultIO.this.type =
    new HardfloatMultIO(bitWidth).asInstanceOf[this.type]

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
}
