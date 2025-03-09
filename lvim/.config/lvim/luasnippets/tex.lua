return {
  s("tex_article", {
    t({
      "% Configuration",
      "\\documentclass[11pt,letter,english]{article}",
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage[english]{babel} % To obtain English text with the blindtext package",
      "\\usepackage{blindtext}",
      "\\usepackage{float}",
      "\\usepackage{url}",
      "\\usepackage{amsfonts}",
      "\\usepackage{amsmath}",
      "\\usepackage{amssymb}",
      "",
    }),
    t({"% Title Block", ""}),
    t({"\\title{"}), i(1), t({"}", ""}),
    t({
      "\\author{Shams E Shifat}",
      "\\date{\\today}",
      "",
      "",
      "% Begin Document",
      "\\begin{document}",
      "\\maketitle",
      "",
      "",
      "% Section: ",
    }), i(2),
    t({"","\\section{"}),rep(2),t({"}", ""}),i(4),
    t({
      "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
      "",
      "  \\subsection{Subsection 1}",
      "  Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
      "",
      "    \\subsubsection{SubSubSection 2}",
      "    Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
      "",
    }),
    t({
    "",
    "",
    "% Section: ",
    }), i(3),
    t({"","\\section{"}),rep(3),t({"}", ""}),i(5),
    t({
      "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
    }),
    t({
    "",
    "",
    "",
    "\\end{document}",
    }),
  })
}

