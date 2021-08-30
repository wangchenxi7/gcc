#/bin/bash


###
# environments
Install_path="${HOME}/gcc5-self-build"


###
# Build for old kernel, e.g., 4.5
# However, gcc 5.5 can't support option "-no-pie" even with these flags
old_kernel_flags="--enable-default-pie CONF_GCC_SUPPORTS_NO_PIE=YES"

num_core=`nproc --all`


###
# user command
op=$1

###
# Parse operations

if [ -z "${op}" ]
then
  echo "oepration is null, please input"
  read op
fi
echo "input oepration : ${op}"


###
# Do the operation

if [ "${op}" = "configure" ]
then
  echo "./configure --prefix=${Install_path}   CFLAGS="-fPIC -g -O2" --disable-multilib ${old_kernel_flags}"
  ./configure --prefix=${Install_path}   CFLAGS="-fPIC -g -O2" --disable-multilib ${old_kernel_flags}

elif [  "${op}"  = "build" ]
then
 
  echo " make -j${num_core}" 
  make -j${num_core}

elif [ "${op}" = "clean" ]
then
  echo "make distclean"
  make distclean
else
  echo "wrong oepration ${op} !"
fi
