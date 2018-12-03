import chisel3._

import pe._

object PEGenMain extends App {
  // weightRF, actvtnRF, intrnlRF, dataType, functionType
  val config1 = PEConfig(480 * 8, 32 * 8, 32 * 8, INT8, ReLU)
  val config2 = PEConfig(240 * 8, 16 * 8, 16 * 8, INT8, ReLU)
  val config3 = PEConfig(120 * 8, 8 * 8, 8 * 8, INT8, ReLU)
  val config4 = PEConfig(60 * 8, 4 * 8, 4 * 8, INT8, ReLU)
  val config5 = PEConfig(8, 8, 8, INT8, ReLU)
  val config6 = PEConfig(480 * 8, 32 * 8, 32 * 8, FP8, ReLU)
  val config7 = PEConfig(240 * 8, 16 * 8, 16 * 8, FP8, ReLU)
  val config8 = PEConfig(120 * 8, 8 * 8, 8 * 8, FP8, ReLU)
  val config9 = PEConfig(60 * 8, 4 * 8, 4 * 8, FP8, ReLU)
  val config10 = PEConfig(8, 8, 8, FP8, ReLU)
  val config11 = PEConfig(960 * 8, 64 * 8, 64 * 8, FP16, ReLU)
  val config12 = PEConfig(480 * 8, 32 * 8, 32 * 8, FP16, ReLU)
  val config13 = PEConfig(240 * 8, 16 * 8, 16 * 8, FP16, ReLU)
  val config14 = PEConfig(120 * 8, 8 * 8, 8 * 8, FP16, ReLU)
  val config15 = PEConfig(16, 16, 16, FP16, ReLU)
  val config16 = PEConfig(960 * 8, 64 * 8, 64 * 8, BF16, ReLU)
  val config17 = PEConfig(480 * 8, 32 * 8, 32 * 8, BF16, ReLU)
  val config18 = PEConfig(240 * 8, 16 * 8, 16 * 8, BF16, ReLU)
  val config19 = PEConfig(120 * 8, 8 * 8, 8 * 8, BF16, ReLU)
  val config20 = PEConfig(16, 16, 16, BF16, ReLU)

  iotesters.Driver(() => new PE(config11), backendType = "verilator") {
    c => new PETester(c)
  }
}
