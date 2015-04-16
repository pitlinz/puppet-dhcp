# == Class dhcp::server::params
#
class dhcp::server::params {
  case $::operatingsystem {
    ubuntu, debian: {
      $package_name = 'isc-dhcp-server'
    }
    centos, redhat, Scientific: {
      $package_name = 'dhcp'
    }
    default: {
      fail('Unsupported operating system')
    }
  }
}
