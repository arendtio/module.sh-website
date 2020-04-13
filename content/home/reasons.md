+++
# About widget.
widget = "blank"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 50  # Order that this section will appear in.

title = "Reasons"
subtitle = "Other good reasons to use Module.sh"
author = "admin"

+++

## Scope

When your scripts become larger you often struggle with the fact
that every variable name is part of the global scope (even the ones
within functions). An easy fix is to use the `local` keyword. But
did you know that `local` is not POSIX compliant?

Module.sh solves the issue by isolating every module within its own
Sub-Shell. That way you can keep using global variable names, as
global gets limited to your module.

## Compatibility

Did you know that a simple statement like `echo "Error Message" >/dev/stderr`
is not POSIX compliant? (/dev/stderr is not part of POSIX)

Similar to e.g. Javascript, shell code is supposed to run on a
variety of different operating systems and shells. Therefore,
reusing high quality modules and improving the quality of existing
ones is quite helpful and makes life easier.
