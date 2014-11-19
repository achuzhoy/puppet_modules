class enable_vm_migration {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
  include libvirt
  include iptables
  class { shared_nfs_storage:
        nfsshare => $nfsshare,
  }
}
