+++
title = "How to use Module.sh"

date = 2018-11-06T00:00:00
# lastmod = 2018-09-09T00:00:00

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "How to use Module.sh"
[menu.doc]
  parent = "Quick Start"
  weight = 1
+++

After [downloading](/#download) Module.sh it should be straight
forward to use it. 

At first it must be loaded, either by sourcing it:

```sh
. "$(dirname "$(readlink -f "$0")")/module.sh"
```

Or by using the eval+curl chain:

```sh
eval "$(curl -fsL "https://mdl.sh/latest")"
```

## Usage

The usage can be described as follows:

```
module [-s] name url [checksum]
```

So Module.sh takes

- one optional flag `-s`
- two mandatory positional parameters
- one optional positional parameter

The optional flag `-s` controls if module.sh executes the module in a
sub-shell to preserve the global scope. In general, is should be not
be set. The main use-case is writing a similar tool like module.sh
which requires access to the global scope.

With the first manadatory argument you can control under which name
you want to be able to reach the module. Within Module.sh we use the
lower camel case reprensentation of the module name, but you are
free to use whatever you like.

The second mandatory parameter is the url und which the module is
accessable. The protocol must be HTTPS.

The last parameter is optional, but recommended. If set, it should
contain a checksum for the module. The checksum consist of two parts
which are separated by a '-'. The first part defines which program
should be used to calculate the checksum, the second part is the
first part of the checksum.

## Calculating checksums

To calculate the checksum of the module `hello-world` the following
commands can be used:

For cksum:

```sh
printf 'cksum-%s\n' "$(printf '%s' "$(curl -fsL "https://mdl.sh/misc/hello-world/hello-world-1.0.1.sh")" | cksum | cut -d ' ' -f1)"
```

For md5sum:

```sh
printf 'md5sum-%s\n' "$(printf '%s' "$(curl -fsL "https://mdl.sh/misc/hello-world/hello-world-1.0.1.sh")" | md5sum | cut -d ' ' -f1)"
```

In general, we recommend using cksum as it is part of POSIX. If the
checksum should provide some security aspect you might want consider
using sha256sum.

