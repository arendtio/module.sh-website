+++
title = "Understanding Module.sh"

date = 2018-11-06T00:00:00
# lastmod = 2018-09-09T00:00:00

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

echo "Hello World"
```

and use it in a normal script (demo.sh):

```sh
#!/bin/sh
set -eEuo pipefail

eval "$(curl -fsL "https://mdl.sh/module/module-static-0.9.0.sh")"
module "helloWorld" "https://mdl.sh/hello-world/hello-world-1.0.0.sh"

helloWorld
```

Now we will download the compiler and make it executable:

```sh
curl -O https://mdl.sh/module-tools/compiler-0.9.0.sh
chmod +x compiler-0.9.0.sh
```

To compile the demo.sh we use the following command:

```sh
./compiler-0.9.0.sh demo.sh demo-static.sh
```

Afterwards we can see the compiled result (demo-static.sh):

```sh
#!/bin/sh
set -eEuo pipefail

# start module https://mdl.sh/hello-world/hello-world-1.0.0.sh
helloWorld() {(
echo "Hello World"
)}
# end module https://mdl.sh/hello-world/hello-world-1.0.0.sh

helloWorld
```

So basically it looks like we expected it. The lines for loading
module.sh and loading the hello-world module got replaced by the
content of the hello-world module plus the wrapper (and some
additional comments).
