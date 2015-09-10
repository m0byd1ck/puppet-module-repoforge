# Class repoforge
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Requires:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, et al)
#
# Sample Usage:
#   include repoforge
#

class repoforge (
    $repoforge         = $repoforge::params::repoforge,
    $repoforge_extras  = $repoforge::params::repoforge_extras,
    $repoforge_testing = $repoforge::params::repoforge_testing,
    $os_maj_release    = $repoforge::params::os_maj_release,
    $os_basearch       = $repoforge::params::os_basearch,
  ) inherits repoforge::params {

  if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ {

    yumrepo { 'repoforge':
      descr       => "RHEL ${os_maj_release} ${os_basearch} - RPMforge.net - dag",
      baseurl     => $repoforge['baseurl'],
      mirrorlist  => $repoforge['mirrorlist'],
      enabled     => $repoforge['enabled'],
      gpgcheck    => $repoforge['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
      includepkgs => $repoforge['include'],
      exclude     => $repoforge['exclude'],
    }

    yumrepo { 'repoforge-extras':
      descr       => "RHEL ${os_maj_release} ${os_basearch} - RPMforge.net - extras",
      baseurl     => $repoforge_extras['baseurl'],
      mirrorlist  => $repoforge_extras['mirrorlist'],
      enabled     => $repoforge_extras['enabled'],
      gpgcheck    => $repoforge_extras['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
      includepkgs => $repoforge_extras['include'],
      exclude     => $repoforge_extras['exclude'],
    }

    yumrepo { 'repoforge-testing':
      descr       => "RHEL ${os_maj_release} ${os_basearch} - RPMforge.net - testing",
      baseurl     => $repoforge_testing['baseurl'],
      mirrorlist  => $repoforge_testing['mirrorlist'],
      enabled     => $repoforge_testing['enabled'],
      gpgcheck    => $repoforge_testing['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
      includepkgs => $repoforge_testing['include'],
      exclude     => $repoforge_testing['exclude'],
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/repoforge/RPM-GPG-KEY-rpmforge-dag',
    }

    repoforge::rpm_gpg_key{ 'repoforge':
      path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
      before => Yumrepo['repoforge','repoforge-extras','repoforge-testing'],
    }
  } else {
      notice ("Your operating system ${::operatingsystem} will not have the RepoForge repository applied")
  }
}
