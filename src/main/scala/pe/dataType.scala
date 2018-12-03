package pe

sealed trait DataType {
  def bitWidth: Int
  def isFloat: Boolean
}

case object INT8 extends DataType { val bitWidth = 8; val isFloat = false }
case object INT16 extends DataType { val bitWidth = 16; val isFloat = false }
case object INT32 extends DataType { val bitWidth = 32; val isFloat = false  }
case object INT64 extends DataType { val bitWidth = 64; val isFloat = false  }

case object FP8 extends DataType { val bitWidth = 8; val isFloat = true }
case object FP16 extends DataType { val bitWidth = 16; val isFloat = true  }
case object FP32 extends DataType { val bitWidth = 32; val isFloat = true  }
case object FP64 extends DataType { val bitWidth = 64; val isFloat = true  }

case object BF16 extends DataType { val bitWidth = 16; val isFloat = true  }