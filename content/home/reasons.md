+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = 2016-04-20T00:00:00

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Reasons"
subtitle = "Other good Reasons to use Module.sh"

# Order that this section will appear in.
weight = 7

+++

## Scope

When your Scripts become larger you often struggle with the fact
that every variable name is part of the global scope (even the ones
within functions). An easy fix is to use the `local` keyword. But
did you know that `local` is not POSIX compliant?

Module.sh solves the issue by isolating every module within its own
Sub-Shell. That way you can keep using global variable names, as
global gets limited to your module.
