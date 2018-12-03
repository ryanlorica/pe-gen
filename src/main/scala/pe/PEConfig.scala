package pe

import pe.act.ACTConfig
import pe.mac.MACConfig
import pe.rf.RFConfig

case class PEConfig(weightRFSize: Int,
                    actvtnRFSize: Int,
                    intrnlRFSize: Int,
                    dataType: DataType,
                    functionType: FunctionType) {
  val weightRFConfig = RFConfig(weightRFSize, dataType.bitWidth)
  val actvtnRFConfig = RFConfig(actvtnRFSize, dataType.bitWidth)
  val intrnlRFConfig = RFConfig(intrnlRFSize, dataType.bitWidth)
  val macConfig = MACConfig(dataType)
  val actConfig = ACTConfig(dataType, functionType)
}
