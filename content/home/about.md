+++
# About/Biography widget.
widget = "about"
active = true
date = 2016-04-20T00:00:00

# Order that this section will appear in.
weight = 2

+++

# Why

Reusing shell scripts is hard as packaging is often complicated by
itself and therefore they live scattered all over our disks and when
we need a specific one the search begins.

Module.sh is set to improve upon that situation. It can fetch the
required script easily from the internet, either at runtime or it
can build you a script which embeds all its script dependencies.

While that might sound like it has a few challenges by its own,
Module.sh does so while caching fetched scripts and checking checksums
before execution.

```
#!/bin/sh
# yes, we aim to be POSIX compliant

# loading module.sh, if curl+eval is a problem, there are ways to avoid them
eval "$(curl -fsL "https://mdl.sh/latest")"

# using module.sh to load the hello-world module
module "helloWorld" "https://mdl.sh/hello-world/hello-world-1.0.0.sh" "cksum-1466632224"

# executing the loaded module
helloWorld
```

If you don't want to rely on an external service: you don't have
to. Actually, there are many reasons to host your scripts on your
own server.
