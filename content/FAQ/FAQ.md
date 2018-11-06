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
module "helloWorld" "https://mdl.sh/hello-world/hello-world-1.0.0.sh" "sha256sum-a37ed750daa549599dba74f66030bd351b41c6ea227c0b1cd596e7efc6a5cada"
```

