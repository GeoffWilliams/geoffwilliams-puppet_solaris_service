# Class: puppet_solaris_service
# ===========================
#
# Update the puppet solaris service file to customise variables
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `service_file`
# The solaris service file to update.  Defaults to `/lib/svc/method/pe-puppet`
# 
# * `ld_library_path`
# Replacement `ld_library_path` variable to use.  Pass `false` to remove this
# directive or a string to export.
#
# Examples
# --------
# Customise the ld_library_path
# @example
#    class { 'puppet_solaris_service':
#      ld_library_path => "/usr/local/lib",
#    }
#
# Remove a custom ld_library_path
# @example
#   class { 'puppet_solaris_service': }
#
# Authors
# -------
#
# Geoff Williams <geoff.williams@puppetlabs.com>
#
# Copyright
# ---------
#
# Copyright 2015 Puppet Labs, unless otherwise noted.
#
class puppet_solaris_service(
    $service_file = "/lib/svc/method/pe-puppet", 
    $ld_library_path = false,
) {

  if $ld_library_path {
    $ld_library_path_ensure = present
  } else {
    $ld_library_path_ensure = absent
  }
  
  file_line { "solaris_service_ld_library_path":
    ensure => $ld_library_path_ensure,
    path   => $service_file,
    line   => "LD_LIBRARY_PATH=${ld_library_path};export LD_LIBRARY_PATH",
    match  => "LD_LIBRARY_PATH=",
    after  => "#!/sbin/sh",
  }

}
