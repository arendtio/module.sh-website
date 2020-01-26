+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = 2016-04-20T00:00:00

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Reasons"
subtitle = "Other good reasons to use Module.sh"

# Order that this section will appear in.
weight = 7

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
ones is quite helpful and makes the life easier.
