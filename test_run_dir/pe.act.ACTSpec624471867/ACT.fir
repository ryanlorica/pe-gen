;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.12.4, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:36:29.913, builtAtMillis: 1536780989913
circuit ACT : 
  module ACT : 
    input clock : Clock
    input reset : UInt<1>
    output io : {ctrl : {flip enable : UInt<1>}, flip input : UInt<8>, output : UInt<8>}
    
    when io.ctrl.enable : @[ACT.scala 13:29]
      node _T_7 = asSInt(io.input) @[ACT.scala 14:30]
      node _T_9 = lt(_T_7, asSInt(UInt<1>("h00"))) @[ACT.scala 14:33]
      when _T_9 : @[ACT.scala 14:40]
        io.output <= UInt<1>("h00") @[ACT.scala 15:21]
        skip @[ACT.scala 14:40]
      else : @[ACT.scala 16:22]
        io.output <= io.input @[ACT.scala 17:21]
        skip @[ACT.scala 16:22]
      skip @[ACT.scala 13:29]
    else : @[ACT.scala 19:20]
      io.output <= UInt<1>("h00") @[ACT.scala 20:19]
      skip @[ACT.scala 19:20]
    
