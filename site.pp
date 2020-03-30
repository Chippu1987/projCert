node 'ip-172-31-82-92.ec2.internal'{
        file{'/info2.txt':
            ensure => 'present',
            content => 'created by puppet in testing env',
            }
        package{'docker.io':
                provider => 'apt',
                ensure => 'installed'
               }
        service{'docker':
                ensure => 'running',
                enable => true,
               }
        package{'git':
                provider => 'apt',
                ensure => 'installed'
               }

}

