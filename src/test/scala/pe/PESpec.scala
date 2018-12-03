package pe

import org.scalatest.{FlatSpec, Matchers}

import chisel3._

class PESpec extends FlatSpec with Matchers {

  behavior of "PE"

  it should "Instantiate correctly" in {

    val config = PEConfig(weightRFSize = 8, actvtnRFSize = 8, intrnlRFSize = 8,
      dataType = INT8, functionType = ReLU)

    chisel3.iotesters.Driver(() => new PE(config)) { c =>
      new PEInstance(c)
    } should be(true)
  }
}
