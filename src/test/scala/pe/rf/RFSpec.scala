package pe.rf

import org.scalatest.{FlatSpec, Matchers}

class RFSpec extends FlatSpec with Matchers {

  behavior of "RF"

  it should "Instantiate correctly" in {

    val config = RFConfig(memSize = 8, dataWidth = 8)

    chisel3.iotesters.Driver(() => new RF(config)) { c =>
      new RFInstance(c)
    } should be(true)
  }
}
