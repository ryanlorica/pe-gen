package pe.fp

import chisel3.iotesters.PeekPokeTester

class FPAddTester(c: FPAdd) extends PeekPokeTester(c) {
  poke(c.io.in1, 10)
  poke(c.io.in2, 10)
  step(10)

  poke(c.io.in1, 20)
  poke(c.io.in2, 21)
  step(10)
}

