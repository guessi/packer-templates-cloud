# Packer Templates for Building Cloud Images

## Prerequisite

- AWS client profile with proper IAM policies attached

## Supported Operation Systems

- Ubuntu Server 16.04 LTS
- Ubuntu Server 18.04 LTS
- Ubuntu Server 20.04 LTS

## Usage

### Build Amazon Machine Image (AMI)

```bash
cp variables/example.json \
   variables/myprofile.json

vim variables/myprofile.json

AWS_PROFILE=myprofile packer build -var-file variables/myprofile.json templates/aws/ubuntu-server-16-04.json
AWS_PROFILE=myprofile packer build -var-file variables/myprofile.json templates/aws/ubuntu-server-18-04.json
AWS_PROFILE=myprofile packer build -var-file variables/myprofile.json templates/aws/ubuntu-server-20-04.json
```

## FAQ

- [Amazon Builder FAQ](https://www.packer.io/docs/builders/amazon/#troubleshooting)

