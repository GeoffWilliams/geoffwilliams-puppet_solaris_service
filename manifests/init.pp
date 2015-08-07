# Defined Resource Type: puppet_solaris_service
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
# * `restart_service`
# Restart this service after performing a change.  Defaults to the service
# being altered
#
# Examples
# --------
# Customise the ld_library_path
# @example
#    puppet_solaris_service { "pe-puppet":
#      ld_library_path => "/usr/local/lib",
#    }
#
# Remove a custom ld_library_path
# @example
#   puppet_solaris_service { "pe-puppet": }
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
define puppet_solaris_service(
    $service_file     = "/lib/svc/method/${title}", 
    $ld_library_path  = false,
    $restart_service  = $title,
) {

  if $ld_library_path {
    $ld_library_path_ensure = present
  } else {
    $ld_library_path_ensure = absent
  }
  
  file_line { "solaris_service_${title}_ld_library_path":
    ensure => $ld_library_path_ensure,
    path   => $service_file,
    line   => "LD_LIBRARY_PATH=${ld_library_path};export LD_LIBRARY_PATH",
    match  => "LD_LIBRARY_PATH=",
    after  => "#!/sbin/sh",
    notify => Service[$restart_service],
  }

}
