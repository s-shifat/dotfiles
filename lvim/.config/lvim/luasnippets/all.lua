return {
  -- A snippet that expands the trigger "hi" into the
  -- string "Hello, world"
  s(
    { trig = "hi" },
    { t("Hello, world") }
  ),

  -- string "Hello, world"
  s(
    { trig = "yo" },
    { t("yooo") }
  ),
  s("trigger", {
    t({ "After expanding, the cursor is here ->" }), i(1),
    t({ "Ami", "After jumping forward once, cursor is here ->", "Eikhane:" }), i(2),
    t({ "Theke     Jibon", "After jumping once more, the snippet is exited there ->" }), i(0),
  })
}

