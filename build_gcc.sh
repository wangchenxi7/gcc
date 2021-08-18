#/bin/bash


###
# environments
Install_path="${HOME}/gcc-self-build"



###
# Do the operation

configure --prefix=${Install_path} --disable-multilib
