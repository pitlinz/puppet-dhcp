/**
 * install the server
 */
class dhcp::server::install(

) {

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

  	package { $package_name:
    	ensure => installed,
  	}

	if ($::operatingsystem == ubuntu) {
	    /*
	     * see https://tickets.puppetlabs.com/browse/PUP-1055
	     */
	  	file{"/etc/init/isc-dhcp-server.conf":
	  	    owner 	=> 'root',
			group 	=> 'root',
			mode	=> '0555',
			content	=> template("dhcp/isc-dhcp-server.conf.erb"),
			require => Package["isc-dhcp-server"]
		}
	  	file{"/etc/init/isc-dhcp-server6.conf":
	  	    owner 	=> 'root',
			group 	=> 'root',
			mode	=> '0555',
			content	=> template("dhcp/isc-dhcp-server6.conf.erb"),
			require => Package["isc-dhcp-server"]
		}
	}
}
