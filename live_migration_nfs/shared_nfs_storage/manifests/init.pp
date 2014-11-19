class shared_nfs_storage ($nfsshare){
  $folder="/var/lib/nova/instances"
  file {$folder:
    ensure => directory,
    owner => 'nova',
    group => 'nova',
  }
  file_line {"fstab":
      require => File[$folder],
      path => "/etc/fstab",
      line => "$nfsshare     /var/lib/nova/instances    nfs     defaults     0 0",
      match => ".*/var/lib/nova/instances.*",
      notify => Exec['mount_instances'],
    }
  exec {"mount_instances":
    command => "mount -a",
    unless => "df /var/lib/nova/instances/ --output=source|grep -q :",
    refreshonly => true,
  }
}
