package pe.fp

import chisel3._
import chisel3.util._
import pe._

class FPMult(dataType: DataType) extends Module {

  val io: FPMultIO = IO(new FPMultIO(dataType.bitWidth))

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