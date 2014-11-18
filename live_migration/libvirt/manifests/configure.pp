class libvirt::configure {
  $libvirt_file="/etc/sysconfig/libvirtd"
  $libvirt_conf="/etc/libvirt/libvirtd.conf"
  define change_line ($line,$match,$path) {
    file_line {$title:
      require => File[$path], 
      path => $path,
      line => $line,
      match => $match,
    }
  }
  file {$libvirt_conf:
    require => Class['libvirt::package'],
    ensure => present,
  }
  change_line {'a':
    line =>'listen_tls = 0',
    match => "^.*listen_tls =.*$",
    path => $libvirt_conf,
    before => File[$libvirt_file], 
  }
  change_line {'b':
    line =>'listen_tcp = 1',
    match => "^.*listen_tcp =.*$",
    path => $libvirt_conf,
    before => File[$libvirt_file], 
  }
  change_line {'c':
    line =>'auth_tcp = "none"',
    match => "^.*auth_tcp =.*$",
    path => $libvirt_conf,
    before => File[$libvirt_file], 
  }
  change_line {'d':
    line =>'auth_tls = "none"',
    match => "^.*auth_tls =.*$",
    path => $libvirt_conf,
    before => File[$libvirt_file], 
  }
  file {$libvirt_file:
    ensure => present,
  }
  file_line {$libvirt_file:
    require => File[$libvirt_file],
    path => $libvirt_file,
    line =>'LIBVIRTD_ARGS="--listen"',
    match => "^.*LIBVIRTD_ARGS=.*$",
  }
}
