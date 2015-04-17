class dhcp::server(
  $options    = '',
  $interfaces = 'eth0',    
) {
  class{"dhcp::server::install":
    
  }

  class{"dhcp::server::config":
    options => $options,
    interfaces => $interfaces,    
    require => Class["dhcp::server::install"]
  }
  
  class{"dhcp::server::service":
    require => Class["dhcp::server::config"];
  }
}
