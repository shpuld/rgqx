RgQx
=======

This is a more experimental fork of RgQuake. Changes the look and feel away from Quake. To get RgQuake, go to https://github.com/shpuld/rgquake/

Building
--------

Linux only, cygwin or WSL might work, I've only tested native Ubuntu.

- Make sure you've installed the opendingux toolchain.
- Check that the INCLUDES matches your toolchain paths in the Makefile.
- `make` builds the executable into `./bin`.
- `./make_opk.sh` then copies the binary to opk_data and creates the .opk file.

License
-------

This is a fork of RgQuake, RgQuake is licensed under the GPLv2.  You should have received a copy of the GPLv2 in a file called COPYING in the same directory as this README.  If you did not, contact the distributor from whom you recieved this software for a copy.
