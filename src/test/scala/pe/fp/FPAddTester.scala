package pe.fp

import chisel3.iotesters.PeekPokeTester

class FPAddTester(c: FPAdd) extends PeekPokeTester(c) {
  poke(c.io.in1, 0)
  poke(c.io.in2, 0)
  step(100)
  expect(c.io.out, 0)
}

