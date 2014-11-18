class libvirt::service {
  service {"libvirtd":
    require => Class['libvirt::package'],
    ensure => 'running',
    enable => 'true',
  }
}
