# Packer Templates for Building Cloud Images

## Prerequisite

- AWS profile with [required permissions](https://www.packer.io/plugins/builders/amazon#iam-task-or-instance-role)
- [Packer](https://www.packer.io/downloads)

## Supported Operation Systems

- Ubuntu Server LTS (22.04, 24.04)

## Usage (required packer v1.10.0+)

    $ export AWS_PROFILE=my_aws_profile

    $ cd aws
    $ vim vars/ubuntu.pkvars.hcl # build images with single config file
    $ ./build.sh # build images parallelly

## FAQ

- [Amazon Builder FAQ](https://www.packer.io/plugins/builders/amazon#troubleshooting)

## License

- [LICENSE](https://github.com/guessi/packer-templates-cloud/blob/master/LICENSE)
