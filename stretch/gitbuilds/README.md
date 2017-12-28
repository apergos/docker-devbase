These files are intended for folks who want to use git-buildpackage
in a docker container for building WMF packages.  I use jessie as
the base container, build the dev image on top of that, and then add
the gbp goodies.

I don't just 'build on my laptop' because I'm one of those black sheep
not running debian or ubuntu or another deb-based distro.

Note that this has MY settings in here, for MY convenience.  If, for
some strange reason, you want to use this, be sure to replace all the
cruft in bashrc_addons and root_gitconfig appropriately; you will also
want to set up your volumes for the pbuilder cache, the gbp build
area, and your git repos used for builds, and then fix up the volume
mounts in create-pbuild-container.sh appropriately.

