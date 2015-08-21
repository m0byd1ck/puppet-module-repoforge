# Configure RepoForge repository

## About

The following repo will be setup and enabled by default:

  * rpmforge

Other repositories that will setup but disabled

  * rpmforge-extras
  * rpmforge-testing

## Usage
### Simple Usage

    include repoforge

### Advanced Usage
    
    class {'repoforge':
        repoforge           = [
            'enabled'    => '1',
            'gpgcheck'   => '1',
            'baseurl'    => "http://apt.sw.be/redhat/el7/en/x86_64/rpmforge",
            'mirrorlist' => "http://mirrorlist.repoforge.org/el7/mirrors-rpmforge",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ],
          repoforge_extras  = [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'baseurl'    => "http://apt.sw.be/redhat/el7/en/x86_64/extras",
            'mirrorlist' => "http://mirrorlist.repoforge.org/el7/mirrors-rpmforge-extras",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ],
          repoforge_testing = [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'baseurl'    => "http://apt.sw.be/redhat/el7/en/x86_64/testing",
            'mirrorlist' => "http://mirrorlist.repoforge.org/el7/mirrors-rpmforge-testing",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ]
    }

## Futher Information

* [repoforge website](http://repoforge.org/)

## Testing

* This was tested using Puppet 3.8.2 on CentOS 7
* Use at your own risk, I do not offer any guarantee or warranty

## License
Apache Software License 2.0
