package pe.act

import org.scalatest.{FlatSpec, Matchers}
import pe._

class ACTSpec extends FlatSpec with Matchers {

  behavior of "ACT"

  it should "Instantiate correctly" in {

    val config = ACTConfig(dataType = INT8, functionType = ReLU)

    chisel3.iotesters.Driver(() => new ACT(config)) { c =>
      new ACTInstance(c)
    } should be(true)
  }
}
