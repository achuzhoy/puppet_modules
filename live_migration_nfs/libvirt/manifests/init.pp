class libvirt {
  include libvirt::package
  include libvirt::configure
  include libvirt::service
}
