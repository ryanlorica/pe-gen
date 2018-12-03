;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.12.4, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:36:29.913, builtAtMillis: 1536780989913
circuit RF : 
  module RF : 
    input clock : Clock
    input reset : UInt<1>
    output io : {ctrl : {flip rEnable : UInt<1>, flip wEnable : UInt<1>, flip rAddr : UInt<3>, flip wAddr : UInt<3>}, flip dataIn : UInt<8>, dataOut : UInt<8>}
    
    wire _T_21 : UInt<8>[8] @[RF.scala 9:25]
    _T_21[0] <= UInt<8>("h00") @[RF.scala 9:25]
    _T_21[1] <= UInt<8>("h00") @[RF.scala 9:25]
    _T_21[2] <= UInt<8>("h00") @[RF.scala 9:25]
    _T_21[3] <= UInt<8>("h00") @[RF.scala 9:25]
    _T_21[4] <= UInt<8>("h00") @[RF.scala 9:25]
    _T_21[5] <= UInt<8>("h00") @[RF.scala 9:25]
    _T_21[6] <= UInt<8>("h00") @[RF.scala 9:25]
    _T_21[7] <= UInt<8>("h00") @[RF.scala 9:25]
    reg regs : UInt<8>[8], clock with : (reset => (reset, _T_21)) @[RF.scala 9:21]
    when io.ctrl.wEnable : @[RF.scala 11:26]
      regs[io.ctrl.wAddr] <= io.dataIn @[RF.scala 12:25]
      skip @[RF.scala 11:26]
    when io.ctrl.rEnable : @[RF.scala 15:26]
      io.dataOut <= regs[io.ctrl.rAddr] @[RF.scala 16:16]
      skip @[RF.scala 15:26]
    else : @[RF.scala 17:16]
      io.dataOut <= UInt<1>("h00") @[RF.scala 18:16]
      skip @[RF.scala 17:16]
    
