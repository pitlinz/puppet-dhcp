# == Class dhcp
#
class dhcp {
  include dhcp::server::install
  include dhcp::server::config
  include dhcp::server::service
}
