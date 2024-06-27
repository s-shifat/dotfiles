-- https://github.com/ahmedkhalf/project.nvim
-- Core Plugin: https://www.lunarvim.org/docs/features/core-plugins-list

lvim.builtin.project.patterns = {
  -- General
  "lazy-lock.json",
  ".git",
  "_darcs",
  ".hg",
  ".bzr",
  ".svn",
  "Makefile",
  "package.json",
  "pom.xml",
  -- Python Specific
  "pyproject.toml",
  "main.py",
  -- To specify the root has a certain directory as its direct ancestor / parent
  -- (useful when you put working projects in a common directory), prefix it with >:
  ">projects",
  ">Documents",
  -- ">notes"
}
