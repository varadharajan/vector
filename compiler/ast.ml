type binop = Add | Sub | Mul | Div | Mod
    | Lshift | Rshift
    | Less | LessEq | Greater | GreaterEq | Eq | NotEq
    | BitAnd | BitXor | BitOr | LogAnd | LogOr

type assignop =
      AddAssn | SubAssn | MulAssn | DivAssn | ModAssn
    | LshiftAssn | RshiftAssn
    | BitOrAssn | BitAndAssn | BitXorAssn ;;

type preop = Neg | LogNot | BitNot | PreDec | PreInc

type postop = PostDec | PostInc

type datatype =
    Type of string

type ident =
    Ident of string

type expr =
    Binop of expr * binop * expr
  | AssignOp of ident * assignop * expr
  | Preop of preop * expr
  | Postop of expr * postop
  | Assign of ident * expr
  | IntLit of int32
  | Int64Lit of int64
  | FloatLit of float
  | ComplexLit of Complex.t
  | StringLit of string
  | CharLit of char
  | ArrayLit of expr list
  | Cast of datatype * expr
  | Variable of ident
  | FunctionCall of ident * expr list
  | ArrayIndex of expr * expr list
  | ArrayAssign of expr * expr list * expr

type decl =
    AssigningDecl of ident * expr
  | PrimitiveDecl of datatype * ident
  | ArrayDecl of datatype * ident * expr list

type iterator =
    RangeIterator of ident * expr * expr * expr
  | ArrayIterator of ident * expr

type statement =
    CompoundStatement of statement list
  | Declaration of decl
  | Expression of expr
  | EmptyStatement
  | IfElseStatement of expr * statement * statement
  | IfStatement of expr * statement
  | WhileStatement of expr * statement
  | ForStatement of iterator list * statement
  | PforStatement of iterator list * statement
  | FunctionDecl of datatype * ident * decl list * statement list
  | ReturnStatement of expr
  | VoidReturnStatement
