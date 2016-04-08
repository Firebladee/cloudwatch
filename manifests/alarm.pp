define cloudwatch::alarm (
  $metric,
  $namespace,
  $statistic,
  $period,
  $evaluation,
  $threshold,
  $comparison,
  $region,

  $dimensions    = undef,
  $alarm_actions = undef,
){

  cloudwatch_alarm { $name:
    metric              => $metric,
    namespace           => $namespace,
    statistic           => $statistic,
    period              => $period,
    evaluation_periods  => $evaluation,
    threshold           => $threshold,
    comparison_operator => $comparison,
    region              => $region,
  }
}
