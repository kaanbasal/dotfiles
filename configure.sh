#!/bin/bash

bash_profile_path=~/.bash_profile

if [ ! -f "${bash_profile_path}" ]; then
  echo "Creating .bash_profile file"
  echo "" >> ${bash_profile_path}
fi

for dir in `find . -maxdepth 2 -mindepth 2 -type d`
do
  dir=$(pwd)/${dir}
  suffix=$(basename $(dirname $dir))_$(basename $dir)
  install_sh=${dir}/install.sh
  bash_local=${dir}/bash_local

  echo $bash_local

  if [ -f "${install_sh}" ]; then
    echo "Configuring ${install_sh}"
    bash ${install_sh}
  fi

  if [ -f "${bash_local}" ]; then
    echo "Importing ${bash_local}"
    link_path=~/.bash_local_${suffix}
    rm -f ${link_path}
    ln -s ${bash_local} ${link_path}
    grep -q -F "${link_path}" ${bash_profile_path} || echo "source ${link_path}" >> ${bash_profile_path}
  fi
done
