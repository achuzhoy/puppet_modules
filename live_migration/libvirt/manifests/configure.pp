class libvirt::configure {
  $libvirt_file="/etc/sysconfig/libvirtd"
  $libvirt_conf="/etc/libvirt/libvirtd.conf"
  define change_line ($line,$match,$path) {
    file_line {$title:
      require => File[$path], 
      path => $path,
      line => $line,
      match => $match,
      notify => Service['libvirtd'],
    }
  }
  file {$libvirt_conf:
    require => Class['libvirt::package'],
    ensure => present,
  }
  change_line {'libvirtd.conf1':
    line =>'listen_tls = 0',
    match => "^.*listen_tls =.*$",
    path => $libvirt_conf,
    before => Change_line['libvirtd1'],
  }
  change_line {'libvirtd.conf2':
    line =>'listen_tcp = 1',
    match => "^.*listen_tcp =.*$",
    path => $libvirt_conf,
    before => Change_line['libvirtd1'],
  }
  change_line {'libvirtd.conf3':
    line =>'auth_tcp = "none"',
    match => "^.*auth_tcp =.*$",
    path => $libvirt_conf,
    before => Change_line['libvirtd1'],
  }
  change_line {'libvirtd.conf4':
    line =>'auth_tls = "none"',
    match => "^.*auth_tls =.*$",
    path => $libvirt_conf,
    before => Change_line['libvirtd1'],
  }
  file {$libvirt_file:
    ensure => present,
  }
  change_line {'libvirtd1':
    line =>'LIBVIRTD_ARGS="--listen"',
    path => $libvirt_file,
    match => "^.*LIBVIRTD_ARGS=.*$",
    before => Class['libvirt::service'],
  }
}
