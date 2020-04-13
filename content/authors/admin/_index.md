---
# Display name
name: Module.sh

# Username (this should match the folder name)
authors:
- admin

# Is this the primary user of the site?
superuser: true

# Role/position
role: Composable and Robust<br/> Shell Scripts

# Social/Academic Networking
# For available icons, see: https://sourcethemes.com/academic/docs/page-builder/#icons
#   For an email link, use "fas" icon pack, "envelope" icon, and a link in the
#   form "mailto:your-email@example.com" or "#contact" for contact widget.
social:
- icon: github
  icon_pack: fab
  link: https://github.com/arendtio/mdl.sh

---

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
module "helloWorld" "https://mdl.sh/misc/hello-world/hello-world-1.0.1.sh" "cksum-3769348439"

# executing the loaded module
helloWorld
```

If you don't want to rely on an external service: you don't have
to. Actually, there are many reasons to host your scripts on your
own server.
