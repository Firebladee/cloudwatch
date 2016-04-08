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
    name        => $name,
    metric      => $mertic,
    namespace   => $namespace,
    statistic   => $statistic,
    period      => $period,
    evaluation  => $evaluation_periods,
    threshold   => $threshold,
    comparision => $comparision_operator,
    region      => $region,
  }
}
