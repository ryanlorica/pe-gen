package pe.fp

import org.scalatest.{FlatSpec, Matchers}
import pe.FP16

class FPAddSpec extends FlatSpec with Matchers {

  behavior of "FPAdd"

  it should "Instantiate correctly" in {

    val config = FP16

    chisel3.iotesters.Driver(() => new FPAdd(config)) { c =>
      new FPAddInstance(c)
    } should be(true)
  }
}
