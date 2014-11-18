class libvirt::configure {
  $libvirt_file="/etc/sysconfig/libvirtd"
  $libvirt_conf="/etc/libvirt/libvirtd.conf"
  file {$libvirt_conf:
    require => Class['libvirt::package'],
    ensure => present,
  }
  file_line {$libvirt_conf:
    require => File[$libvirt_conf],
    path => $libvirt_conf,
    line =>'listen_tls = 0',
    match => "^.*listen_tls =.*$",
  }
  
  file {$libvirt_file:
    ensure => present,
    require => File_line['append'],
  }
  file_line {$libvirt_file:
    require => File[$libvirt_file],
    path => $libvirt_file,
    line =>'LIBVIRTD_ARGS="--listen"',
    match => "^.*LIBVIRTD_ARGS=.*$",
  }
}
