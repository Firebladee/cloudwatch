[![Build Status](https://travis-ci.org/Firebladee/cloudwatch.svg?branch=master)](https://travis-ci.org/Firebladee/cloudwatch)
[![Coverage Status](https://coveralls.io/repos/github/Firebladee/cloudwatch/badge.svg?branch=master)](https://coveralls.io/github/Firebladee/cloudwatch?branch=master)
# cloudwatch

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with cloudwatch](#setup)
    * [What cloudwatch affects](#what-cloudwatch-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with cloudwatch](#beginning-with-cloudwatch)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module is to allow the aws cloudwatch command to be used withing puppet.

This module will create the cloudwatch metrics and alarms.

## Setup

### Setup Requirements **OPTIONAL**

This module will not set up the ablility to run aws commands on the target machine.
You will need some other module to set that up.  Also this module will not setup any
iam rules that may be needed for your metrics/alarms to work.

### Beginning with cloudwatch

The easists way to use this module is by hiera.

```Puppet
---
classes:
  - cloudwatch

cloudwatch::metric_alarm:
  test2:
    metric: 'testing'
    namespace: 'AWS/EC2'
    statistic: 'Maximum'
    period: '300'
    evaluation: '2'
    threshold: '1'
    comparison: 'GreaterThanThreshold'
    region: 'us-east-1'
```

## Usage

Above is an example of generating an alarm.  Below is an example for creating an metric.
```Puppet
cloudwatch::metric_data:
  'test_metric':
    region: 'us-east-1'
    folder_name: '/tmp/metric'
    template_name: 'testing'
    template_dir: '/tmp/metric'
    cron_name: 'testing'
    cron_cmd: '/tmp/metric/testing >> /tmp/metric/log 2>&1'
    cron_hour: '*'
    cron_minute: '*/1'
    template_mode: '0744'
    template_cmd: 'nc -vz testing.com 80'
```

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
