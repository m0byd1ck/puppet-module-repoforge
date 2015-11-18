# Puppet RepoForge Module

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with repoforge module](#beginning-with-repoforge-module)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Development](#development)
6. [Further Information](#further-information)

## Description

This module will install the repoforge repository

The following repo will be setup and enabled by default:

  * rpmforge

Other repositories that will setup but disabled

  * rpmforge-extras
  * rpmforge-testing

## Setup

### Setup Requirements

None

### Beginning with repoforge module	

    include repoforge
    
## Usage

    class {'repoforge':
        repoforge           => [
            'enabled'    => '1',
            'gpgcheck'   => '1',
            'baseurl'    => "http://apt.sw.be/redhat/el7/en/x86_64/rpmforge",
            'mirrorlist' => "http://mirrorlist.repoforge.org/el7/mirrors-rpmforge",
            'include'    => ['package1', 'package*'],
            'exclude'    => ['package1', 'package*']
          ],
          repoforge_extras  => [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'baseurl'    => "http://apt.sw.be/redhat/el7/en/x86_64/extras",
            'mirrorlist' => "http://mirrorlist.repoforge.org/el7/mirrors-rpmforge-extras",
            'include'    => ['package1', 'package*'],
            'exclude'    => ['package1', 'package*']
          ],
          repoforge_testing => [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'baseurl'    => "http://apt.sw.be/redhat/el7/en/x86_64/testing",
            'mirrorlist' => "http://mirrorlist.repoforge.org/el7/mirrors-rpmforge-testing",
            'include'    => ['package1', 'package*'],
            'exclude'    => ['package1', 'package*']
          ]
    }

## Limitations

* This was tested using Puppet 3.8.2 on CentOS 7
* Use at your own risk, I do not offer any guarantee or warranty

## Development

Please create a pull request via GitHub

## Further Information

* [repoforge website](http://repoforge.org/)