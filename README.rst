puppet-sysctl: sysctl and interfaces configuration
==================================================

Puppet-sysctl use 
`augeas <http://augeas.net/>`_
to make changes to the standard system config files
in a non destructive fashion. That means it never overwrites any config files,
but only adds or changes the required entries.

Default functionality
---------------------

By default sysctl prepares your machine for load balancing by lvs in direct
routing mode, by adding an extra network interface to a virtual ip on lo:0 and
configuring the arp table to not broadcast that ip.

Usage::

    class {"sysctl":
        virtual_ip => '192.168.0.33'
    }

Extra functionality
-------------------

- sysctl::lotsofsockets including this resource will prepare the server to keep
  lots of sockets open (+100k). Usage::
  
      include sysctl::lotsofsockets

