local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local parse = ls.parser.parse_snippet
local with_priority = require("luasnip-latex-snippets.util.utils").with_priority

local math_iA = {
  s(
    {
      trig = "(%a)bar",
      wordTrig = false,
      regTrig = true,
      name = "bar",
      priority = 100,
    },
    f(function(_, snip)
      return string.format("\\overline{%s}", snip.captures[1])
    end, {})
  ),
  s(
    {
      trig = "(%a)hat",
      wordTrig = false,
      regTrig = true,
      name = "hat",
      priority = 100,
    },
    f(function(_, snip)
      return string.format("\\hat{%s}", snip.captures[1])
    end, {})
  ),

  -- BEGIN (AHAN98)
  parse({ trig = "_", name = "underscore" }, "_{$1}$0 "),
  parse({ trig = "nin", name = "not in" }, "\\not\\in "),
  parse({ trig = "sbeq", name = "subseteq" }, "\\subseteq "),
  parse({ trig = "speq", name = "supseteq" }, "\\supseteq "),
  parse({ trig = "Cup", name = "bigcup" }, "\\bigcup_{${1:i \\in ${2: I}}} $0"),
  parse({ trig = "cup", name = "cup" }, "\\cup_{${1:i \\in ${2: I}}} $0"),
  parse({ trig = "Cap", name = "bigcap" }, "\\bigcap_{${1:i \\in ${2: I}}} $0"),
  parse({ trig = "cap", name = "cap" }, "\\cap_{${1:i \\in ${2: I}}} $0"),
  parse({ trig = "fim", name = "infimum" }, "\\inf_{$1}$0 "),
  parse({ trig = "sup", name = "supremum" }, "\\sup_{$1}$0 "),
  with_priority(parse({ trig = "amin", name = "argmin" }, "\\argmin_{$1}$0 "), 1100),
  with_priority(parse({ trig = "amax", name = "argmax" }, "\\argmax_{$1}$0 "), 1100),
  parse({ trig = "min", name = "min" }, "\\min_{$1}$0 "),
  parse({ trig = "max", name = "max" }, "\\max_{$1}$0 "),
  parse({ trig = ":=", name = "colon equals (lhs defined as rhs)" }, "\\coloneqq "),
  parse({ trig = "=:", name = "equals colon (rhs defined as lhs)" }, "\\eqqcolon "),

  -- parse({ trig = "norm", name = "norm || . ||" }, "\\left\\lVert $1\\right\\rVert$0 "),
  parse({ trig = "norm", name = "norm || . ||" }, "\\norm{ $1 }$0 "),
  parse({ trig = "sim", name = "tilde symbol ~" }, "\\sim $0 "),
  -- END

  parse({ trig = "td", name = "to the ... power ^{}" }, "^{$1}$0 "),
  parse({ trig = "rd", name = "to the ... power ^{()}" }, "^{($1)}$0 "),
  parse({ trig = "cb", name = "Cube ^3" }, "^3 "),
  parse({ trig = "sr", name = "Square ^2" }, "^2"),

  parse({ trig = "EE", name = "exists" }, "\\exists "),
  parse({ trig = "AA", name = "forall" }, "\\forall "),
  parse({ trig = "xnn", name = "xn" }, "x_{n}"),
  parse({ trig = "ynn", name = "yn" }, "y_{n}"),
  parse({ trig = "xii", name = "xi" }, "x_{i}"),
  parse({ trig = "yii", name = "yi" }, "y_{i}"),
  parse({ trig = "xjj", name = "xj" }, "x_{j}"),
  parse({ trig = "yjj", name = "yj" }, "y_{j}"),
  parse({ trig = "xp1", name = "x" }, "x_{n+1}"),
  parse({ trig = "xmm", name = "x" }, "x_{m}"),
  parse({ trig = "R0+", name = "R0+" }, "\\mathbb{R}_0^+"),

  -- parse({ trig = "notin", name = "not in " }, "\\not\\in "),
  --
  -- parse({ trig = "cc", name = "subset" }, "\\subset "),

  with_priority(parse({ trig = "<->", name = "leftrightarrow" }, "\\leftrightarrow"), 200),
  with_priority(parse({ trig = "...", name = "ldots" }, "\\ldots "), 100),
  parse({ trig = "!>", name = "mapsto" }, "\\mapsto "),
  parse({ trig = "iff", name = "iff" }, "\\iff"),
  parse({ trig = "ooo", name = "\\infty" }, "\\infty"),
  parse({ trig = "rij", name = "mrij" }, "(${1:x}_${2:n})_{${3:$2}\\in${4:\\N}}$0"),
  parse({ trig = "nabl", name = "nabla" }, "\\nabla "),
  parse({ trig = "<!", name = "normal" }, "\\triangleleft "),
  parse({ trig = "floor", name = "floor" }, "\\left\\lfloor $1 \\right\\rfloor$0"),
  parse({ trig = "mcal", name = "mathcal" }, "\\mathcal{$1}$0"),
  parse({ trig = "//", name = "Fraction" }, "\\frac{$1}{$2}$0"),
  parse({ trig = "\\\\\\", name = "setminus" }, "\\setminus"),
  with_priority(parse({ trig = "->", name = "to" }, "\\to "), 100),
  parse({ trig = "letw", name = "let omega" }, "Let $\\Omega \\subset \\C$ be open."),
  -- parse({ trig = "nnn", name = "bigcap" }, "\\bigcap_{${1:i \\in ${2: I}}} $0"),
  -- parse({ trig = "norm", name = "norm" }, "\\|$1\\|$0"),
  parse({ trig = "<>", name = "hokje" }, "\\diamond "),
  parse({ trig = ">>", name = ">>" }, "\\gg"),
  parse({ trig = "<<", name = "<<" }, "\\ll"),

  parse({ trig = "stt", name = "text subscript" }, "_\\text{$1} $0"),
  parse({ trig = "tt", name = "text" }, "\\text{$1}$0"),

  parse({ trig = "xx", name = "cross" }, "\\times "),
  with_priority(parse({ trig = "**", name = "cdot" }, "\\cdot "), 100),

  parse(
    { trig = "cvec", name = "column vector" },
    "\\begin{pmatrix} ${1:x}_${2:1}\\\\ \\vdots\\\\ $1_${2:n} \\end{pmatrix}"
  ),
  parse({ trig = "ceil", name = "ceil" }, "\\left\\lceil $1 \\right\\rceil $0"),
  parse({ trig = "OO", name = "emptyset" }, "\\O"),
  parse({ trig = "EE", name = "E" }, "\\mathbb{E}"),
  parse({ trig = "RR", name = "R" }, "\\mathbb{R}"),
  parse({ trig = "QQ", name = "Q" }, "\\mathbb{Q}"),
  parse({ trig = "ZZ", name = "Z" }, "\\mathbb{Z}"),
  -- parse({ trig = "UU", name = "cup" }, "\\cup "),
  parse({ trig = "NN", name = "n" }, "\\mathbb{N}"),
  parse({ trig = "||", name = "mid" }, " \\mid "),
  -- parse({ trig = "Nn", name = "cap" }, "\\cap "),
  parse({ trig = "bmat", name = "bmat" }, "\\begin{bmatrix} $1 \\end{bmatrix} $0"),
  -- parse({ trig = "uuu", name = "bigcup" }, "\\bigcup_{${1:i \\in ${2: I}}} $0"),
  parse({ trig = "DD", name = "D" }, "\\mathbb{D}"),
  parse({ trig = "HH", name = "H" }, "\\mathbb{H}"),
  parse({ trig = "lll", name = "l" }, "\\ell"),
  with_priority(
    parse(
      { trig = "dint", name = "integral" },
      "\\int_{${1:-\\infty}}^{${2:\\infty}} ${3:${TM_SELECTED_TEXT}} $0"
    ),
    300
  ),

  parse({ trig = "==", name = "equals" }, [[&= $1 \\\\]]),
  parse({ trig = "!=", name = "not equals" }, "\\neq "),
  parse({ trig = "compl", name = "complement" }, "^{c}"),
  parse({ trig = "__", name = "subscript" }, "_{$1}$0"),
  parse({ trig = "=>", name = "implies" }, "\\implies"),
  parse({ trig = "=<", name = "implied by" }, "\\impliedby"),
  parse({ trig = "<<", name = "<<" }, "\\ll"),

  parse({ trig = "<=", name = "leq" }, "\\le "),
  parse({ trig = ">=", name = "geq" }, "\\ge "),
  parse({ trig = "invs", name = "inverse" }, "^{-1}"),
  parse({ trig = "~~", name = "~" }, "\\sim "),
  parse({ trig = "conj", name = "conjugate" }, "\\overline{$1}$0"),
}

return math_iA
