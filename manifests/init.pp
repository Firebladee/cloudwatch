# Class: cloudwatch
# ===========================
#
# Full description of class cloudwatch here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'cloudwatch':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class cloudwatch (
  $metric_data  = undef,
  $metric_alarm = undef,
  $set_alarm    = undef,
  $metric_list  = undef,
){
#  validate ($set_alarm)
#  validate ($metric_list)

  if $metric_data != undef {
    validate_hash($metric_data)
    create_resources(cloudwatch::data, $metric_data)
  }

  if $metric_alarm != undef {
    validate_hash($metric_alarm)
    create_resources(cloudwatch::alarm, metric_alarm)
  }
}
