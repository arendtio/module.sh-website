+++
title = "How to use module-local"

draft = true # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "How to use module-local"
[menu.doc]
  parent = "Quick Start"
  weight = 2
+++

If you have saved the above module to a file called `greeter.sh` you
can use it in a second (non-module; same directory) script as
follows:

```
#!/bin/sh

# load module.sh
eval "$(curl -fsL "https://mdl.sh/latest")"

# load module-local
module -s "moduleLocal" "https://mdl.sh/module-local/module-local-0.9.0.sh"

# load module greeter with modulLocal

# load module greeter with modulLocal
moduleLocal "greeter" "greeter.sh"
```

You might have noticed that `-s` flag behind `module`. It means that
this module will not be embedded in a sub-shell but instead be
`sourced` and therefore be able to defined functions (and variables)
in the scope of your script. This in turn means that changing the
name `moduleLocal` has no effect and is just used to remind you what
you imported here.

