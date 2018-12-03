package pe.fp

import org.scalatest.{FlatSpec, Matchers}
import chisel3._
import pe._

class FPMultSpec extends FlatSpec with Matchers {

  behavior of "FPMult"

  it should "Instantiate correctly" in {

    val config = FP16

    chisel3.iotesters.Driver(() => new FPMult(config)) { c =>
      new FPMultInstance(c)
    } should be(true)
  }
}
