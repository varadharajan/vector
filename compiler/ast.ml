type operator = Add | Sub | Mul | Div | Mod
    | Lshift | Rshift
    | Less | LessEq | Greater | GreaterEq | Eq | NotEq
    | BitAnd | BitXor | BitOr | LogAnd | LogOr ;;

type expr =
    Binop of expr * operator * expr
  | Assign of string * expr
  | IntLit of int
  | Ident of string ;;

type statement =
    CompoundStatement of statement list
  | Expression of expr
  | AssigningDecl of string * expr
  | PrimitiveDecl of string * string
  | ArrayDecl of string * string * expr
  | EmptyStatement
