package pe.fp

import chisel3._

import pe._

abstract class HardfloatAdd(dataType: DataType) extends BlackBox {
  val io: HardfloatAddIO = IO(new HardfloatAddIO(dataType.bitWidth))
}