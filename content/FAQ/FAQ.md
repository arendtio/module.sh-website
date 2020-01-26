+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = 2016-04-20T00:00:00

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Frequently Asked Questions"
subtitle = ""

# Order that this section will appear in.
weight = 1

+++

### What happens when the repository is offline?

Scripts won't work. There are exceptions e.g., if the cache holds
all required scripts, but in many cases the script just will not
run. To avoid such a dependency on a working server you can compile
your script into a static script with our [module
compiler](https://github.com/arendtio/mdl.sh/tree/master/module-tools).

### What is the difference between module.sh and mdl.sh?

Those are both domains of this project. The website is hosted on
module.sh and the code repository on mdl.sh (which is module.sh with
the vowels removed). We thought that it would be nice to have a
short domain like mdl.sh to be used in the code. 

### Why do you use cksum and not something more secure like sha256sum?

For POSIX compliance. To our knowledge cksum is part of POSIX and
should be available on all POSIX compliant operating sytems.
Nevertheless, for your own scripts you can choose something
stronger. Just take a quick look at how the
[validation](https://github.com/arendtio/mdl.sh/tree/master/module)
happens. For example:

```
module "helloWorld" "https://mdl.sh/misc/hello-world/hello-world-1.0.1.sh" "sha256sum-b92a2908dfa6fde76550702e375939688c53b46e96cae882781e067ba8549d80"
```

### Why should I not want to use module.sh at all?

Foremost, it makes your scripts slower. There are different factors
here:

1. When you use the dynamic version, the time to fetch the module
   obviously adds to the runtime.
2. Modules are being wrapped in sub-shells, in order to give them a
   separate scope. Depending on your coding style and use-case,
   this can add quite much run time.

If you use the compiler, your scripts will also increase in size.
Not just because of the module wrapping code, but also because
the same module might be included multiple times (if multiple
modules depend on it). This is because we favor a simple and robust
architecture over static script size.

After all, we consider these downsides acceptable since shell coding
is not about speed, but about composability. So if performance is an
issue for you, you might want to take a look a different programming
language anyway (like C, Go, Rust, et al.)

### Are there any tools to help me write POSIX compliant modules?

[Shellcheck](https://github.com/koalaman/shellcheck) is a good start
and there is a nice [list](https://shellhaters.org/) with commands
supported by POSIX complient operating system.
