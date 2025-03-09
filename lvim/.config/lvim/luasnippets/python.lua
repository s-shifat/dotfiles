return {

  -- Starter for Data Science Scripts
  s("dsdoc", {
      t({
        "import numpy as np",
        "import pandas as pd",
        "import matplotlib.pyplot as plt",
        "",
        "",
        "df = pd.read_csv(\""
      }), i(1),
      t({ "\")", "" }),
      t({
      "print(df)",
      "print(\"Data Type Information:\")",
      "print(df.info())",
      ""
    }),
    }
  ),

  -- Jupyter NoteBook | Jupynium Specific
  -- Jupynium -> Start Python Code Cell
  s("codecell", {
      t({
      "# %%",
      ""
      }), i(1),
    }
  ),

  -- Jupynium -> Start Markdown Cell
  s("markdowncell", {
      t({
      "# %% [md]",
      "\"\"\"",
      "",
      }), i(1),
      t({
      "",
      "\"\"\"",
    })
    }
  ),
}

