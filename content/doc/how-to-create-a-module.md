+++
title = "How to create a module"

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "How to create a Module"
[menu.doc]
  parent = "Quick Start"
  weight = 3
+++

Next we are taking a look at how to create a module
Creating a module is easy. In general, modules are just plain shell
scripts.

## Requirements

There are just two things to be aware of:

1. a shebang MUST be present (e.g., `#!/bin/sh`, if POSIX compliant)

2. modules should assume the function `module` is defined

## Example

This example module ('Greeter') takes one argument, the name, and
writes a message containing that name to standard out. If no name is
provided it writes an error message to standard error and returns
error code 1:

```sh
#!/bin/sh

name="$1"

if [ "$name" != "" ]; then
	printf 'Hello %s' "$name"
else
	echo "No name provided to module Greeter" >/dev/stderr
	return 1
fi
```

In order, to foster cooperation and the online availability of
modules, module.sh doesn't support importing modules from
filesystem. So if you want to use your module you should place it on
a web-server (e.g., example.org) and load it from there:

```
#!/bin/sh

# load module.sh
eval "$(curl -fsL "https://mdl.sh/latest")"

# load  module greeter
module "greeter" "https://example.com/greeter.sh"

# use module greeter
greeter "Bob"
```

Executing that script should result in `Hello Bob`

Since we also acknowledge that for module developers it is an
important feature to load modules from disk (which we required
ourselves during the development of module.sh), we added an extra
module [module-local](/doc/how-to-use-module-local/) to our
repository (not published yet).

## Best practices

Since the strength of shell scripts is not its performance, but its
compability to run on different platforms, we encurage POSIX
compliance and correntness.

### Shebangs

If you have gone the extra mile to create a POSIX compliant script
you can and should use the `#!/bin/sh` shebang.

If you were lazy and used e.g., bash syntax, please use the modern
`#!/usr/bin/env bash` shebang.

### Options

Modules should not set options themselves but should be able to run
with the following configuration:

```
set -eEuo pipefail
```

This means abort script execution if

- a command returned a non-zero error code outside of a condition
  clause (-e)
- even in sub-shells (-E)
- and pipes (-o pipefail)
- or if an unbound/undefined variable is used (-u)

### Shellcheck

Another great way to help you writing awesome scripts is the tool
[shellcheck](https://github.com/koalaman/shellcheck).

## Publishing on mdl.sh

If you have followed the best practices and are willing to donate
your script to the public domain, please feel free to create a pull
request via [Github](https://github.com/arendtio/mdl.sh).
