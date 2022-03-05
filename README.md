# Packer Templates for Building Cloud Images

## Prerequisite

- AWS CLI with required permissions

## Supported Operation Systems

- Ubuntu Server LTS (16.04 ~ 20.04)

## Usage

Update required changes

    $ vim variables/aws-vars-20.04.json

Setup AWS_PROFILE

    $ export AWS_PROFILE=my_aws_profile

Build AMI

    $ packer build -var-file variables/aws-vars-20.04.json templates/aws_ubuntu-server-lts.json

## FAQ

- [Amazon Builder FAQ](https://www.packer.io/docs/builders/amazon/#troubleshooting)

## License

- [LICENSE](https://github.com/guessi/packer-templates-cloud/blob/master/LICENSE)
