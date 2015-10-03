class dhcp::server(
  $options    = '',
  $interfaces = 'eth0',
) {

  include dhcp::server::install
  include dhcp::server::config
  include dhcp::server::service

}
