
# this module configures different types of sysctl options.
# The default sysctl configuration is used to make the server ready
# for loadbalancing with lvs in gate mode.
#
# This means a virtual ip will be added to the local loopback interface lo:0.
# This way packets for that ip can be received without broadcasting the ip.
#
# Other useful modules are:
#    sysctl::lotsofsockets which configures the machine to handle lots of socket connections.
#    
class sysctl($virtual_ip) {
    include ensureaugeas
    include sysctl::arp
    class {"sysctl::interfaces":
        virtual_ip => $virtual_ip
    }
    Class["ensureaugeas"] -> Class["sysctl::arp"] -> Class["sysctl::interfaces"]
}

