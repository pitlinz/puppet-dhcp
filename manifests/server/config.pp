# == Class dhcp::server::config
#
class dhcp::server::config(
  $options    = $::dhcp::server::options,
  $interfaces = $::dhcp::server::interfaces,
) {

  file { '/etc/dhcp':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/dhcp/dhcpd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => [File['/etc/dhcp'],Class['dhcp::server::install']],
    notify  => Class['dhcp::server::service'],
  }

  file { '/etc/dhcp/subnets':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/etc/dhcp'],
  }

  file { '/etc/dhcp/hosts':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/etc/dhcp'],
  }

  file { '/etc/default/isc-dhcp-server':
    ensure => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("dhcp/default.erb")
  }

}
