class sysctl::interfaces($virtual_ip) {
    #    auto lo:0
    #    iface lo:0 inet static
    #    address 172.31.8.2
    #    netmask 255.255.255.255
    augeas { "network":
        context => "/files/etc/network/interfaces",
        changes => [
            "set auto[child::1 = 'lo:0']/1 lo:0",
            "set iface[. = 'lo:0'] lo:0",
            "set iface[. = 'lo:0']/family inet",
            "set iface[. = 'lo:0']/method static",
            "set iface[. = 'lo:0']/address ${virtual_ip}",
            "set iface[. = 'lo:0']/netmask 255.255.255.255",
        ],
        require => Class["ensureaugeas"],
        notify => Exec["reload-sysctl-and-activate-interface"],
    }
    
    # no way you can start the interface before reloading sysctl.
    exec {"reload-sysctl-and-activate-interface":
        command => "/sbin/sysctl -p",
        refreshonly => true,
        notify => Exec["activate-interface"],
        require => Class["sysctl::arp"],
    }

    exec {"activate-interface":
        command => "/sbin/ifup lo:0",
        refreshonly => true,
    }
}