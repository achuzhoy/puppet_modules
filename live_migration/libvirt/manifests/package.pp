class libvirt::package {
  package {"libvirt":
    allow_virtual => false,
    ensure => 'installed',
    before => Class['libvirt::service'],
  }
}
