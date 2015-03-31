GObject Generator
=================

GObject generator is a (Non)GUI tool for generating sources for a GObject class.


Usage
=====

Tool usage:

    $ gobject-gen -h
    usage: gobject-gen [-h] [-c KLASS] [-b BASE] [-p] [-g] [-f] [-d] [-y]

    optional arguments:
      -h, --help               show this help message and exit
      -c KLASS, --class KLASS  Class name
      -b BASE, --base BASE     Base class name
      -p, --include-private    Include private struct
      -g, --include-get-set    Include GObject property get/set
      -f, --include-finalize   Include finalize
      -d, --include-dispose    Include dispose
      -y, --no-gui             Generate source files without GUI


Non-GUI example of usage:

    $ gobject-gen -y -c FooBarBaz
    $ ls *.[hc]
    foo-bar-baz.c  foo-bar-baz.h


BUG REPORTS
===========

Report bugs to **[phatina@redhat.com](mailto:phatina@redhat.com)**
or **[gobject-gen issues][]**.

[gobject-gen issues]: https://github.com/phatina/gobject-gen/issues "Report a bug"
