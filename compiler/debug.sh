#!/bin/bash
set -e

# This script will parse and scan STDIN into an AST, which it then prints.
# 
# Usage:
#   echo '3 + 3' | $0
# or
#   cat example_file.vec | $0
#
# It contains many kludges.

cd ../
scons -c > /dev/null
scons > /dev/null
cd compiler

PARSE='
open Ast;;\n
\n
let lexbuf = Lexing.from_channel stdin in\n
Parser.top_level Scanner.token lexbuf;;'
(echo -e $PARSE; cat -) | ocaml scanner.cmo parser.cmo | tail -n +3 | head -n -1
