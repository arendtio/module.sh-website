+++
# About widget.
widget = "blank"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 40  # Order that this section will appear in.

title = "Downloads"
author = "admin"

+++

## Manual Download

You can always get the latest static version of Module.sh from:

[https://mdl.sh/latest](https://mdl.sh/latest)

Just download it and save it as `module.sh`. To use Module.sh in
your script you have to `source` it like that:

```sh
. ./module.sh
```

If you want to load it relative to your script and not relative to
your current work directory you can use something like:

```sh
. "$(dirname "$(readlink -f "$0")")/module.sh"
```


## Dynamic Script

If you want to let your script download the latest version of
Module.sh during execution you can use the following snippet:

```sh
eval "$(curl -fsL "https://mdl.sh/latest")"
```

After that line, you can use the `module` command. The upside of this
approach is the ease of use. The downside is that it will not work when
the server fails and under certain circumstance can lead to
executing some server error message (if curl doesn't fail). So this
is nice for playing around, but should not be used in production.

