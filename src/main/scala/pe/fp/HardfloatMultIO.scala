package pe.fp

import chisel3._
import pe.DataType

class HardfloatMultIO(bitWidth: Int) extends Bundle {

  override def cloneType: HardfloatMultIO.this.type =
    new HardfloatMultIO(bitWidth).asInstanceOf[this.type]

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
}
