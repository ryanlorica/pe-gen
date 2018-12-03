package pe.mac

import org.scalatest.{FlatSpec, Matchers}

import pe._

class MACSpec extends FlatSpec with Matchers {

  behavior of "MAC"

  it should "Instantiate correctly" in {

    val config = MACConfig(dataType = INT8)

    chisel3.iotesters.Driver(() => new MAC(config)) { c =>
      new MACInstance(c)
    } should be(true)
  }
}
