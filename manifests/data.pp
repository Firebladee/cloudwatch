define cloudwatch::data (
  # Params for aws put-metric-data
  $namespace             = $name,
  $metric_data           = undef,
  $metric_name           = undef,
  $timestamp             = undef,
  $unit                  = undef,
  $value                 = undef,
  $dimensions            = undef,
  $statistic_values      = undef,
  $cli_input_json        = undef,
  $generate_cli_skeleton = undef,

  $owner = root,
  $group = root,
  $mode  = 0755,

  $folder_create = true,
  $folder_name   = undef,

  $template_name    = undef,
  $template_create  = true,
  $template_dir     = undef,
  $template_ensure  = true,
  $template_content = "${module_name}/metric-data.erb",
  $template_owner   = $owner,
  $template_group   = $group,
  $template_mode    = $mode,

  $cron_create = undef,
  $cron_name   = undef,
  $cron_ensure = true,
  $cron_cmd    = undef,
  $cron_user   = $owner,
  $cron_hour   = undef,
  $cron_minute = undef,

){

  # validate
  validate_bool(
    $folder_create,
    $template_create,
    $template_ensure,
    $cron_create,
    $cron_ensure,
  )
  validate_string(
    $template_name,
    $template_dir,
    $template_content,
    $template_root,
    $template_group,
    $template_mode,
    $cron_name,
    $cron_cmd,
    $cron_user,
    $cron_hour,
    $cron_minute,
  )
  
  # folder creation
  if $folder_create {
    $dirtree = dirtree($folder_name)
    endure_resource('file', $dirtree, { 'ensure' => 'directory'})
  }

  # cp template
  if $template_create {
    file { "${template_dir}/${template_name}":
      ensure  => $template_ensure,
      content => template($template_content),
      owner   => $template_owner,
      group   => $template_group,
      mode    => $template_mode,
    }
  }

  # create cron
  if cron_create {
    cron { $cron_name:
      ensure  => $cron_ensure,
      command => $cron_cmd,
      user    => $cron_user,
      hour    => $cron_hour,
      minute  => $cron_minute,
    }
  }
}