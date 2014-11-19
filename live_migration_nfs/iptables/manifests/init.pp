class iptables {
  exec {"open_ports":
    command => 'iptables -I INPUT -s 192.168.0.0/24 -p tcp -m multiport --dports 16509,49152:49215 -m comment --comment "001 nova qemu migration incoming nova_qemu_migration_192.168.0.0" -j ACCEPT && service iptables save',
    unless => "grep -q '16509,49152:49215' /etc/sysconfig/iptables"
  }
}
