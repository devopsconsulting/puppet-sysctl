class sysctl::arp {
    augeas { "arp":
        context => "/files/etc/sysctl.conf",
        changes => [
            "set net.ipv4.conf.all.arp_ignore 1",
            "set net.ipv4.conf.all.arp_announce 2",
            "set net.ipv4.conf.lo.arp_ignore 1",
            "set net.ipv4.conf.lo.arp_announce 2",
        ],
    }    
}