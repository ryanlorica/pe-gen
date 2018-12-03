package pe

sealed trait FunctionType

case object ReLU extends FunctionType
case object Sinh extends FunctionType
case object Tanh extends FunctionType

