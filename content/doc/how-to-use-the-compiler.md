+++
title = "How to use the compiler"

draft = false # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "How to use the Compiler"
[menu.doc]
  parent = "Quick Start"
  weight = 2
+++

The compiler can be use to turn scripts which use Module.sh into
static scripts which contain all their dependecies and do not
require Module.sh anymore. This is a great way to ensure a script
will work even if the repository will be unavailable.

## Download

You can download the compiler from

[https://mdl.sh/development/tools/compiler/compiler-static-0.9.26.sh](https://mdl.sh/development/tools/compiler/compiler-static-0.9.26.sh)

On the shell:

```sh
curl -O https://mdl.sh/development/tools/compiler/compiler-static-0.9.26.sh
chmod +x compiler-0.9.26.sh
```

## Usage

The compiler takes 2 arguments:

1. the scripts file which should be compiled

2. the output file, which should not exist

```sh
./compiler-0.9.26.sh demo.sh demo-static.sh
```
