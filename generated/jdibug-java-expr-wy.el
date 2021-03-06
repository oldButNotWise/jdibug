;;; jdibug-java-expr-wy.el --- Generated parser support file

;; Copyright (C) 2002, 2003, 2004 David Ponce

;; Author: Stan Lanning <slanning@slanning-home>
;; Created: 2020-05-11 11:54:44-0700
;; Keywords: syntax
;; X-RCS: $Id$

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.

;; This software is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; PLEASE DO NOT MANUALLY EDIT THIS FILE!  It is automatically
;; generated from the grammar file jdibug-java-expr.wy.

;;; History:
;;

;;; Code:

(require 'semantic/lex)
(eval-when-compile (require 'semantic/bovine))

;;; Prologue
;;

;;; Declarations
;;
(defconst jdibug-java-expr-wy--keyword-table
  (semantic-lex-make-keyword-table
   '(("boolean" . BOOLEAN)
     ("byte" . BYTE)
     ("char" . CHAR)
     ("class" . CLASS)
     ("double" . DOUBLE)
     ("float" . FLOAT)
     ("instanceof" . INSTANCEOF)
     ("int" . INT)
     ("long" . LONG)
     ("short" . SHORT)
     ("super" . SUPER)
     ("this" . THIS)
     ("void" . VOID))
   '(("void" summary "Method return type: void <name> ...")
     ("short" summary "Integral primitive type (-32768 to 32767)")
     ("long" summary "Integral primitive type (-9223372036854775808 to 9223372036854775807)")
     ("int" summary "Integral primitive type (-2147483648 to 2147483647)")
     ("float" summary "Primitive floating-point type (single-precision 32-bit IEEE 754)")
     ("double" summary "Primitive floating-point type (double-precision 64-bit IEEE 754)")
     ("class" summary "Class declaration: class <name>")
     ("char" summary "Integral primitive type (' ' to '￿') (0 to 65535)")
     ("byte" summary "Integral primitive type (-128 to 127)")
     ("boolean" summary "Primitive logical quantity type (true or false)")))
  "Table of language keywords.")

(defconst jdibug-java-expr-wy--token-table
  (semantic-lex-make-type-table
   '(("number"
      (NUMBER_LITERAL))
     ("string"
      (STRING_LITERAL))
     ("symbol"
      (IDENTIFIER)
      (BOOLEAN_LITERAL . "\\`true\\'")
      (BOOLEAN_LITERAL . "\\`false\\'")
      (NULL_LITERAL . "\\`null\\'"))
     ("punctuation"
      (COMP . "~")
      (OROR . "||")
      (OR . "|")
      (XOR . "^")
      (QUESTION . "?")
      (URSHIFT . ">>>")
      (RSHIFT . ">>")
      (GTEQ . ">=")
      (GT . ">")
      (EQEQ . "==")
      (LTEQ . "<=")
      (LSHIFT . "<<")
      (LT . "<")
      (COLON . ":")
      (DIV . "/")
      (DOT . ".")
      (MINUS . "-")
      (COMMA . ",")
      (PLUS . "+")
      (MULT . "*")
      (ANDAND . "&&")
      (AND . "&")
      (MOD . "%")
      (NOTEQ . "!=")
      (NOT . "!"))
     ("close-paren"
      (RBRACK . "]")
      (RPAREN . ")"))
     ("open-paren"
      (LBRACK . "[")
      (LPAREN . "("))
     ("block"
      (BRACK_BLOCK . "(LBRACK RBRACK)")
      (PAREN_BLOCK . "(LPAREN RPAREN)")))
   '(("keyword" :declared t)
     ("number" :declared t)
     ("string" :declared t)
     ("symbol" :declared t)
     ("punctuation" :declared t)
     ("block" :declared t)))
  "Table of lexical tokens.")

(defconst jdibug-java-expr-wy--parse-table
  (progn
    (eval-when-compile
      (require 'semantic/wisent/comp))
    (wisent-compile-grammar
     '((PAREN_BLOCK BRACK_BLOCK LPAREN RPAREN LBRACK RBRACK NOT NOTEQ MOD AND ANDAND MULT PLUS COMMA MINUS DOT DIV COLON LT LSHIFT LTEQ EQEQ GT GTEQ RSHIFT URSHIFT QUESTION XOR OR OROR COMP NULL_LITERAL BOOLEAN_LITERAL IDENTIFIER STRING_LITERAL NUMBER_LITERAL BOOLEAN BYTE CHAR CLASS DOUBLE FLOAT INSTANCEOF INT LONG SHORT SUPER THIS VOID)
       nil
       (literal
	((NUMBER_LITERAL)
	 (wisent-raw-tag
	  (semantic-tag $1 'constant :type 'number)))
	((BOOLEAN_LITERAL)
	 (wisent-raw-tag
	  (semantic-tag $1 'constant :type 'boolean)))
	((STRING_LITERAL)
	 (let
	     (bare-string)
	   (cond
	    ((string-match "^\"\\(.*\\)\"$" $1)
	     (wisent-raw-tag
	      (semantic-tag
	       (match-string 1 $1)
	       'constant :type 'string)))
	    ((string-match "^'\\(.*\\)'$" $1)
	     (wisent-raw-tag
	      (semantic-tag
	       (match-string 1 $1)
	       'constant :type 'char)))
	    (t
	     (error "Unable to understand string format of %s" $1)))))
	((NULL_LITERAL)
	 (wisent-raw-tag
	  (semantic-tag $1 'constant :type 'null))))
       (primitive_type
	((numeric_type))
	((BOOLEAN)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil))))
       (numeric_type
	((integral_type))
	((floating_point_type)))
       (integral_type
	((BYTE)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil)))
	((SHORT)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil)))
	((INT)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil)))
	((LONG)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil)))
	((CHAR)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil))))
       (floating_point_type
	((FLOAT)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil)))
	((DOUBLE)
	 (wisent-raw-tag
	  (semantic-tag-new-type $1 $1 nil nil))))
       (reference_type
	((class_or_interface_type))
	((array_type)))
       (class_or_interface
	((name_with_opt_package)))
       (class_or_interface_type
	((class_or_interface)))
       (array_type
	((primitive_type dims)
	 (concat $1 $2))
	((name_with_opt_package dims)
	 (concat $1 $2)))
       (name_with_opt_package
	((simple_name))
	((qualified_name)))
       (simple_name
	((IDENTIFIER)
	 (wisent-raw-tag
	  (semantic-tag $1 'identifier))))
       (qualified_name
	((name_with_opt_package DOT simple_name)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'dot "dot"
				     `(,$1 ,$3)))))
       (primary
	((literal))
	((THIS)
	 (wisent-raw-tag
	  (semantic-tag 'this 'identifier)))
	((LPAREN expression RPAREN)
	 (progn $2))
	((dot_expression))
	((simple_name))
	((VOID DOT CLASS)
	 (wisent-raw-tag
	  (semantic-tag 'void 'class)))
	((primitive_type DOT CLASS)
	 (wisent-raw-tag
	  (semantic-tag $1 'class)))
	((primitive_type dims DOT CLASS)
	 (wisent-raw-tag
	  (semantic-tag
	   (wisent-raw-tag
	    (semantic-tag-new-function 'dims "dims"
				       (list $1 $2)))
	   'class))))
       (argument_list_opt
	(nil)
	((argument_list)))
       (argument_list
	((expression)
	 (list $1))
	((argument_list COMMA expression)
	 (append $1
		 (list $3))))
       (dims_opt
	(nil
	 (progn ""))
	((dims)))
       (dims
	((LBRACK RBRACK)
	 (concat $1 $2))
	((dims LBRACK RBRACK)
	 (concat $1 $2 $3)))
       (dot_expression
	((primary DOT IDENTIFIER LPAREN argument_list_opt RPAREN)
	 (wisent-raw-tag
	  (semantic-tag-new-function $3 $3 $5 :this $1)))
	((primary DOT simple_name)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'dot "dot"
				     (list $1 $3))))
	((primary DOT CLASS)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'class "class"
				     (list $1))))
	((array_access)))
       (array_access
	((primary LBRACK expression RBRACK)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'array "array"
				     (list $1 $3)))))
       (postfix_expression
	((primary)))
       (unary_expression
	((PLUS unary_expression)
	 (progn $2))
	((MINUS unary_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'unary-minus "negation"
				     (list $2))))
	((unary_expression_not_plus_minus)))
       (unary_expression_not_plus_minus
	((postfix_expression))
	((COMP unary_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'complement "complement"
				     (list $2))))
	((NOT unary_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'not "negation"
				     (list $2)))))
       (cast_expression
	((LPAREN primitive_type dims_opt RPAREN unary_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'cast "cast"
				     (list $2 $4))))
	((LPAREN name_with_opt_package RPAREN unary_expression_not_plus_minus)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'cast "cast"
				     (list $2 $4))))
	((LPAREN name_with_opt_package dims RPAREN unary_expression_not_plus_minus)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'cast-array "cast"
				     (list $2 $5)
				     :dims $3))))
       (multiplicative_expression
	((unary_expression))
	((multiplicative_expression MULT unary_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'mult "multiplicative_expression type"
				     (list $1 $3))))
	((multiplicative_expression DIV unary_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'div "multiplicative_expression type"
				     (list $1 $3))))
	((multiplicative_expression MOD unary_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'mod "multiplicative_expression type"
				     (list $1 $3)))))
       (additive_expression
	((multiplicative_expression))
	((additive_expression PLUS multiplicative_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'plus "additive_expression type"
				     (list $1 $3))))
	((additive_expression MINUS multiplicative_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'minus "additive_expression type"
				     (list $1 $3)))))
       (shift_expression
	((additive_expression))
	((shift_expression LSHIFT additive_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'left-shift "left shift"
				     (list $1 $3))))
	((shift_expression RSHIFT additive_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'right-shift "right shift"
				     (list $1 $3))))
	((shift_expression URSHIFT additive_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'unsigned-right-shift "unsigned right shift"
				     (list $1 $3)))))
       (relational_expression
	((shift_expression))
	((relational_expression LT shift_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'less-than "less than"
				     (list $1 $3))))
	((relational_expression GT shift_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'greater-than "greater than"
				     (list $1 $3))))
	((relational_expression LTEQ shift_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'less-equal "less than or equal to"
				     (list $1 $3))))
	((relational_expression GTEQ shift_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'greater-equal "greater than or equal to"
				     (list $1 $3)))))
       (instanceof_expression
	((relational_expression))
	((instanceof_expression INSTANCEOF reference_type)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'instance-of "instance of"
				     (list $1 $3)))))
       (equality_expression
	((instanceof_expression))
	((equality_expression EQEQ instanceof_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'equal "equal to"
				     (list $1 $3))))
	((equality_expression NOTEQ instanceof_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'not-equal "not equal to"
				     (list $1 $3)))))
       (and_expression
	((equality_expression))
	((and_expression AND equality_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'bitand "bitwise and"
				     (list $1 $3)))))
       (exclusive_or_expression
	((and_expression))
	((exclusive_or_expression XOR and_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'bitxor "bitwise xor"
				     (list $1 $3)))))
       (inclusive_or_expression
	((exclusive_or_expression))
	((inclusive_or_expression OR exclusive_or_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'bitor "bitwise or"
				     (list $1 $3)))))
       (conditional_and_expression
	((inclusive_or_expression))
	((conditional_and_expression ANDAND inclusive_or_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'logand "logical and"
				     (list $1 $3)))))
       (conditional_or_expression
	((conditional_and_expression))
	((conditional_or_expression OROR conditional_and_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'logor "logical or"
				     (list $1 $3)))))
       (conditional_expression
	((conditional_or_expression))
	((conditional_or_expression QUESTION expression COLON conditional_expression)
	 (wisent-raw-tag
	  (semantic-tag-new-function 'question "question colon"
				     (list $1 $3 $5)))))
       (expression
	((conditional_expression))))
     '(expression dot_expression)))
  "Parser table.")

(defun jdibug-java-expr-wy--install-parser ()
  "Setup the Semantic Parser."
  (semantic-install-function-overrides
   '((parse-stream . wisent-parse-stream)))
  (setq semantic-parser-name "LALR"
        semantic--parse-table jdibug-java-expr-wy--parse-table
        semantic-debug-parser-source "jdibug-java-expr.wy"
        semantic-flex-keywords-obarray jdibug-java-expr-wy--keyword-table
        semantic-lex-types-obarray jdibug-java-expr-wy--token-table)
  ;; Collect unmatched syntax lexical tokens
  (semantic-make-local-hook 'wisent-discarding-token-functions)
  (add-hook 'wisent-discarding-token-functions
            'wisent-collect-unmatched-syntax nil t))


;;; Analyzers
;;
(define-lex-block-type-analyzer jdibug-java-expr-wy--<block>-block-analyzer
  "block analyzer for <block> tokens."
  "\\s(\\|\\s)"
  '((("(" LPAREN PAREN_BLOCK)
     ("[" LBRACK BRACK_BLOCK))
    (")" RPAREN)
    ("]" RBRACK))
  )

(define-lex-string-type-analyzer jdibug-java-expr-wy--<punctuation>-string-analyzer
  "string analyzer for <punctuation> tokens."
  "\\(\\s.\\|\\s$\\|\\s'\\)+"
  '((COMP . "~")
    (OROR . "||")
    (OR . "|")
    (XOR . "^")
    (QUESTION . "?")
    (URSHIFT . ">>>")
    (RSHIFT . ">>")
    (GTEQ . ">=")
    (GT . ">")
    (EQEQ . "==")
    (LTEQ . "<=")
    (LSHIFT . "<<")
    (LT . "<")
    (COLON . ":")
    (DIV . "/")
    (DOT . ".")
    (MINUS . "-")
    (COMMA . ",")
    (PLUS . "+")
    (MULT . "*")
    (ANDAND . "&&")
    (AND . "&")
    (MOD . "%")
    (NOTEQ . "!=")
    (NOT . "!"))
  'punctuation)

(define-lex-regex-type-analyzer jdibug-java-expr-wy--<symbol>-regexp-analyzer
  "regexp analyzer for <symbol> tokens."
  "\\(\\sw\\|\\s_\\)+"
  '((BOOLEAN_LITERAL . "\\`true\\'")
    (BOOLEAN_LITERAL . "\\`false\\'")
    (NULL_LITERAL . "\\`null\\'"))
  'IDENTIFIER)

(define-lex-regex-type-analyzer jdibug-java-expr-wy--<number>-regexp-analyzer
  "regexp analyzer for <number> tokens."
  semantic-lex-number-expression
  nil
  'NUMBER_LITERAL)

(define-lex-sexp-type-analyzer jdibug-java-expr-wy--<string>-sexp-analyzer
  "sexp analyzer for <string> tokens."
  "\\s\""
  'STRING_LITERAL)

(define-lex-keyword-type-analyzer jdibug-java-expr-wy--<keyword>-keyword-analyzer
  "keyword analyzer for <keyword> tokens."
  "\\(\\sw\\|\\s_\\)+")


;;; Epilogue
;;
;; Define the lexer for this grammar
(define-lex jdibug-java-expr-lexer
  "Lexical analyzer that handles Java buffers.
It ignores whitespaces, newlines and comments."
  semantic-lex-ignore-whitespace
  semantic-lex-ignore-newline
  semantic-lex-ignore-comments
  ;;;; Auto-generated analyzers.
  jdibug-java-expr-wy--<number>-regexp-analyzer
  jdibug-java-expr-wy--<string>-sexp-analyzer
  ;; Must detect keywords before other symbols
  jdibug-java-expr-wy--<keyword>-keyword-analyzer
  jdibug-java-expr-wy--<symbol>-regexp-analyzer
  jdibug-java-expr-wy--<punctuation>-string-analyzer
  jdibug-java-expr-wy--<block>-block-analyzer
  ;;;;
  semantic-lex-default-action)

(provide 'jdibug-java-expr-wy)

;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; End:

;;; jdibug-java-expr-wy.el ends here
