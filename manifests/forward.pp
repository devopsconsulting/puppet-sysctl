#net.ipv4.ip_forward = 1

class sysctl::forward {
    augeas { "ip_forward":
        context => "/files/etc/sysctl.conf",
        changes => [
            "set net.ipv4.ip_forward 1",
        ],
    }
}