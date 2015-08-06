# puppet_solaris_service

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with puppet_solaris_service](#setup)
    * [What puppet_solaris_service affects](#what-puppet_solaris_service-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppet_solaris_service](#beginning-with-puppet_solaris_service)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Allows custom parameters to be added to the puppet solaris service file
## Module Description

Edit the puppet solaris configuration file using a `file_line` resource.  
Currently just allows you to set `ld_library_path`.

## Setup

### What puppet_solaris_service affects

* The solaris service file for puppet.  Defaults to `/lib/svc/method/pe-puppet`
  but can be customised via the `service_file` parameter.

## Usage

### Setting a custom ld_library_path
```puppet
class { 'puppet_solaris_service':
  ld_library_path => "/usr/local/lib",
}
```

### Removing a custom ld_library_path
```puppet
class { 'puppet_solaris_service': }
```

## Reference

### puppet_solaris_service
Alter the main solaris service definition file

## Limitations

Tested with Puppet Enterprise 3.8.1.  Will likely need to be altered for Puppet Enterprise 2015 support when this agent is available.  Not supported by Puppet Labs.  To obtain support, customers are advised to return to a stock configuration and reproduce issues before filing a support ticket.

Only for use on Solaris

## Development

PRs accepted.
