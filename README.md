[![wercker status](https://app.wercker.com/status/87c813e77723269d9c2619e500526b6e/s "wercker status")](https://app.wercker.com/project/bykey/87c813e77723269d9c2619e500526b6e)

# Step add-ssh-key

Wercker allows you to generate SSH keys and expose them as via
environment variables to your build or deployment pipeline.
This step can be used to write these values to an IdentityFile
and add them to the SSH configuration.

# Options

- `keyname` The name of the key variable to export, this is without the dollar
sign prefix and without the `_PUBLIC` or `_PRIVATE` suffix.
- `host` The value for setting keys only for certain hosts

# Example

``` yaml
build:
    steps:
        - add-ssh-key:
            keyname: MYPACKAGE_KEY
```

# What's new

Validate if a key is being written

# Changelog

## 1.0.3

- Fix properties section in wercker-step.yml

## 1.0.2

- Fix new wercker environment (avoiding chown issues)

## 1.0.1

- Added host parameter, to set keys only for certain hosts

## 1.0.0

- Add validation of key

## 0.0.3

- Fix: broken identity file

## 0.0.2

- Add ssh-key for root

## 0.0.1

- Initial version

# License

The MIT License (MIT)

Copyright (c) 2013, 2018 Oracle Corporation and/or its affiliates. All rights reserved.

## Contributing to this repository 

Oracle welcomes contributions to this repository from anyone.  Please see [CONTRIBUTING](CONTRIBUTING.md) for more information. 
