package pe

sealed trait DataType {
  def bitWidth: Int
}


case object INT8 extends DataType { val bitWidth = 8 }
case object INT16 extends DataType { val bitWidth = 16 }
case object INT32 extends DataType { val bitWidth = 32 }
case object INT64 extends DataType { val bitWidth = 64 }

case object FP8 extends DataType { val bitWidth = 8 }
case object FP16 extends DataType { val bitWidth = 16 }
case object FP32 extends DataType { val bitWidth = 32 }
case object FP64 extends DataType { val bitWidth = 64 }

case object BF16 extends DataType { val bitWidth = 16 }