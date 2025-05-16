local M = {}

M.file_ignore_patterns = {
  -- Node, Git
  "./node%_modules/*",
  "./.git/*",
  "lazy%-lock%.json",

  -- Python specific
  "%.pyc$", "%.pyo$", "%.pyd$", "%.so$",
  "__pycache__/*",
  "%.egg$", "%.egg%-info/.*", "%.manifest$", "%.spec$",
  "%.coverage$", "%.cover$", "%.py,cover$", "%.mo$", "%.pot$",
  "%.log$", "%.sqlite3$", "%.sqlite3%-journal$",
  "%.tox/.*", "%.nox/.*", "%.hypothesis/.*", "%.pytest_cache/.*",
  "%.mypy_cache/.*", "%.pytype/.*", "%.pyre/.*",
  "%.pdm%-python$", "%.pdm%.toml$", "%.pdm%-build/.*",
  "%.ruff_cache/.*", "%.dmypy%.json$", "dmypy%.json$",
  "%.cache$", "__pypackages__/.*",
  "%.env$", "%.venv$", "^env/.*", "^venv/.*", "^ENV/.*", "^env%.bak/.*", "^venv%.bak/.*",
  "%.ropeproject/.*", "%.spyderproject$", "%.spyproject$", "%.pypirc$",
  "%.Python$", "build/.*", "dist/.*", "downloads/.*", "eggs/.*", "%.eggs/.*",
  "lib/.*", "lib64/.*", "parts/.*", "sdist/.*", "var/.*", "wheels/.*", "share/python%-wheels/.*",
  "%.ipynb$", "%.ipynb_checkpoints/.*",
  "%.pybuilder/.*", "target/.*", "%.scrapy/.*",

  -- Documentation
  "docs/_build/.*", "site/.*",

  -- LaTeX specific
  "main%.aux$", "main%.log$", "main%.out$", "main%.toc$",
  "main%.bbl$", "main%.blg$", "main%.lof$", "main%.lot$",
  "main%.nav$", "main%.snm$", "main%.fls$", "main%.fdb_latexmk$",
  "main%.synctex%.gz$",
}

return M
