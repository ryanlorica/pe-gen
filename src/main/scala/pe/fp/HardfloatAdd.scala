package pe.fp

import chisel3.BlackBox
import chisel3.util.HasBlackBoxResource
import chisel3.experimental._

import pe._

abstract class HardfloatAdd(dataType: DataType) extends BlackBox {
  val io: HardfloatAddIO = IO(new HardfloatAddIO(dataType.bitWidth))
}