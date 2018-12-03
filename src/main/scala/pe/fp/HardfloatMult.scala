package pe.fp

import chisel3._

import pe._

abstract class HardfloatMult(dataType: DataType) extends BlackBox {
  val io: HardfloatMultIO = IO(new HardfloatMultIO(dataType.bitWidth))
}
