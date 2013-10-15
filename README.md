Install vagrant and run `vagrant up` to spin up a VM containing CUDA and ocelot.

Example code is in "examples/".

The build system uses [SCons](http://www.scons.org/). SCons will be installed
on the VM during provisioning. Run the `scons` in the root directory of this
project ("/vagrant/" on the VM). Available targets are the default target (which
builds the compiler) and 'test' (which runs tests).
