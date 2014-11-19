puppet_modules
==============
Ad hoc puppet modules to help with the daily RHOS routines.
1.To enable life migration for RHOS instances, run:
  a. Identify the existing NFS share to be used and export is via nfs_share variable, for example: export nfs_share="192.168.0.1:/nfsshare"
        Note: If nothing is exported - will use "192.168.0.1:/cinder"
  b. yum install -y git puppet &&  git clone https://github.com/schuzhoy/puppet_modules.git && if [ -z $nfs_share ]; then export nfs_share="192.168.0.1:/cinder"; fi;  export FACTER_nfsshare=$nfs_share; puppet apply --modulepath=`pwd`/puppet_modules/live_migration/ -e "include enable_vm_migration"
