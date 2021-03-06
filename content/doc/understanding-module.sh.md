+++
title = "Understanding Module.sh"

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "Understanding Module.sh"
[menu.doc]
  parent = "Quick Start"
  weight = 5
+++

What Module.sh does is quite simple. The complexity comes alone from
making it work under different conditions. So it should be easy to
understand.

## The basic Logic

Whenever we write `module "NAME" "https://example.com/ABC.sh"`
Module.sh replaces that line with the content from the URL, plus a
thin wrapper.

That wrapper makes it available under the name and creates a
sub-shell to separate the scope:

```sh
$name() {(
# [download content]
)}
```

## A simple Example

Let us use the hello-world module

```sh
#!/bin/sh

printf 'Hello World\n'
```

and use it in a normal script (demo.sh):

```sh
#!/bin/sh
set -eEuo pipefail

eval "$(curl -fsL
"https://mdl.sh/development/module/online/module-static-0.9.21.sh")"
module "helloWorld" "https://mdl.sh/misc/hello-world/hello-world-1.0.1.sh"

helloWorld
```

Now we will download the compiler and make it executable:

```sh
curl -O https://mdl.sh/development/tools/compiler/compiler-static-0.9.26.sh
chmod +x compiler-0.9.26.sh
```

To compile the demo.sh we use the following command:

```sh
./compiler-0.9.0.sh demo.sh demo-static.sh
```

Afterwards we can see the compiled result (demo-static.sh):

```sh
#!/bin/sh
set -eEuo pipefail

# start module https://mdl.sh/misc/hello-world/hello-world-1.0.1.sh
helloWorld() {(
printf 'Hello World\n'
)}
# end module https://mdl.sh/misc/hello-world/hello-world-1.0.1.sh

helloWorld
```

So basically it looks like we expected it. The lines for loading
module.sh and loading the hello-world module got replaced by the
content of the hello-world module plus the wrapper (and some
additional comments).
