puppet_modules
==============
Ad hoc puppet modules to help with the daily RHOS routines.
1.  To enable life migration for RHOS instances, run:
     yum install -y git puppet
     git clone https://github.com/schuzhoy/puppet_modules.git && puppet apply --modulepath=`pwd`/puppet_modules/live_migration/ -e "include enable_vm_migration"
