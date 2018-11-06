+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = 2018-11-06T00:00:00

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Downloads"
subtitle = ""

# Order that this section will appear in.
weight = 5

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

