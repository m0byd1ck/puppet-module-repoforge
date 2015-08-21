# Optional parameters in setting up repoforge
class repoforge::params {

  $os_maj_release = $::os_maj_version
  $os_basearch    = $::architecture

  $repoforge         = {
    'enabled'    => '1',
    'gpgcheck'   => '1',
    'baseurl'    => "http://apt.sw.be/redhat/el${os_maj_release}/en/${os_basearch}/rpmforge",
    'mirrorlist' => "http://mirrorlist.repoforge.org/el${os_maj_release}/mirrors-rpmforge",
    'include'    => undef,
    'exclude'    => undef
  }
  $repoforge_extras  = {
    'enabled'    => '0',
    'gpgcheck'   => '1',
    'baseurl'    => "http://apt.sw.be/redhat/el${os_maj_release}/en/${os_basearch}/extras",
    'mirrorlist' => "http://mirrorlist.repoforge.org/el${os_maj_release}/mirrors-rpmforge-extras",
    'include'    => undef,
    'exclude'    => undef
  }
  $repoforge_testing = {
    'enabled'    => '1',
    'gpgcheck'   => '1',
    'baseurl'    => "http://apt.sw.be/redhat/el${os_maj_release}/en/${os_basearch}/testing",
    'mirrorlist' => "http://mirrorlist.repoforge.org/el${os_maj_release}/mirrors-rpmforge-testing",
    'include'    => undef,
    'exclude'    => undef
  }

}