# Cfngoat - Vulnerable Cloudformation Template
[![Maintained by Bridgecrew.io](https://img.shields.io/badge/maintained%20by-bridgecrew.io-blueviolet)](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=INFRASTRUCTURE+SECURITY)
[![CIS AWS](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=CIS+AWS+V1.2)
[![PCI-DSS](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=PCI-DSS+V3.2)
[![SOC2](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=SOC2)
[![ISO](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=ISO27001)
[![NIST-800-53](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=NIST-800-53)
[![slack-community](https://img.shields.io/badge/Slack-4A154B?style=plastic&logo=slack&logoColor=white)](https://slack.bridgecrew.io/)


Cfngoat is one  of Bridgecrew's "Vulnerable by Design" Infrastructure as Code repositories, a learning and training project that demonstrates how common configuration errors can find their way into production cloud environments.

![Cfngoat](.github/cfngoat-removebg-preview.png)

It's an ideal companion to testing build time Infrastructure as Code scanning tools, such as [Bridgecrew](https://bridgecrew.io/) & [Checkov](https://checkov.io) 

## Table of Contents

* [Introduction](#introduction)
* [Installation](#Installation)
* [Contributing](#contributing)
* [Support](#support)

## Introduction

Cfngoat was built to enable DevSecOps design and implement a sustainable misconfiguration prevention strategy. It can be used to test a policy-as-code framework like  [Bridgecrew](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat) & [Checkov](https://github.com/bridgecrewio/checkov/), inline-linters, pre-commit hooks or other code scanning methods.

Cfngoat follows the tradition of existing *Goat projects that provide a baseline training ground to practice implementing secure development best practices for cloud infrastructure.


## Installation
 
```bash
aws cloudformation create-stack --stack-name cfngoat --template-body file://cfngoat.yaml --region us-east-1 --parameters ParameterKey=Password,ParameterValue=MyPassword10 --capabilities CAPABILITY_NAMED_IAM
```

Expect provisioning to take at least 5 minutes.  

Multiple stacks can be deployed simultaniously by changing the `--stack-name` and adding an `Environment` parameter:

```bash
aws cloudformation create-stack --stack-name cfngoat2 --template-body file://cfngoat.yaml --region us-east-1 --parameters ParameterKey=Password,ParameterValue=MyPassword10 ParameterKey=Environment,ParameterValue=dev2 --capabilities CAPABILITY_NAMED_IAM
```

## Important notes

* **Where to get help:** the [Bridgecrew Community Slack](https://slack.bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat)

Before you proceed please take a not of these warning:
> :warning: Cfngoat creates intentionally vulnerable AWS resources into your account. **DO NOT deploy Cfngoat in a production environment or alongside any sensitive AWS resources.**

## Requirements

* aws cli


## Bridgecrew's IaC herd of goats

* [CfnGoat](https://github.com/bridgecrewio/cfngoat) - Vulnerable by design Cloudformation template
* [TerraGoat](https://github.com/bridgecrewio/terragoat) - Vulnerable by design Terraform stack
* [CDKGoat](https://github.com/bridgecrewio/cdkgoat) - Vulnerable by design CDK application

## Contributing

Contribution is welcomed!

We would love to hear about more ideas on how to find vulnerable infrastructure-as-code design patterns.

## Support

[Bridgecrew](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat) builds and maintains Cfngoat to encourage the adoption of policy-as-code.

If you need direct support you can contact us at [info@bridgecrew.io](mailto:info@bridgecrew.io).

## Existing vulnerabilities (Auto-Generated)

### cloudformation scan results:

|    | check_id    | file          | resource                                  | check_name                                                                                                                                                                                               | guideline                                                                                                                                                                                        |
|----|-------------|---------------|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  0 | CKV_AWS_46  | /cfngoat.yaml | AWS::EC2::Instance.EC2Instance            | Ensure no hard-coded secrets exist in EC2 user data                                                                                                                                                      | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/secrets-policies/bc-aws-secrets-1                                                                                |
|  1 | CKV_AWS_3   | /cfngoat.yaml | AWS::EC2::Volume.WebHostStorage           | Ensure all data stored in the EBS is securely encrypted                                                                                                                                                  | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/general-3-encrypt-ebs-volume                                                                |
|  2 | CKV_AWS_23  | /cfngoat.yaml | AWS::EC2::SecurityGroup.WebNodeSG         | Ensure every security groups rule has a description                                                                                                                                                      | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/networking-31                                                                            |
|  3 | CKV_AWS_260 | /cfngoat.yaml | AWS::EC2::SecurityGroup.WebNodeSG         | Ensure no security groups allow ingress from 0.0.0.0:0 to port 80                                                                                                                                        | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/ensure-aws-security-groups-do-not-allow-ingress-from-00000-to-port-80                    |
|  4 | CKV_AWS_24  | /cfngoat.yaml | AWS::EC2::SecurityGroup.WebNodeSG         | Ensure no security groups allow ingress from 0.0.0.0:0 to port 22                                                                                                                                        | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/networking-1-port-security                                                               |
|  5 | CKV_AWS_53  | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket                | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-19                                                                                         |
|  6 | CKV_AWS_21  | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket                | Ensure the S3 bucket has versioning enabled                                                                                                                                                              | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-16-enable-versioning                                                                              |
|  7 | CKV_AWS_55  | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket                | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-21                                                                                         |
|  8 | CKV_AWS_56  | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket                | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-22                                                                                         |
|  9 | CKV_AWS_18  | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket                | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-13-enable-logging                                                                                 |
| 10 | CKV_AWS_54  | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket                | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-20                                                                                         |
| 11 | CKV_AWS_110 | /cfngoat.yaml | AWS::IAM::Policy.UserPolicy               | Ensure IAM policies does not allow privilege escalation                                                                                                                                                  | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-iam-policies-does-not-allow-privilege-escalation                                         |
| 12 | CKV_AWS_109 | /cfngoat.yaml | AWS::IAM::Policy.UserPolicy               | Ensure IAM policies does not allow permissions management without constraints                                                                                                                            | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-iam-policies-do-not-allow-permissions-management-resource-exposure-without-constraint    |
| 13 | CKV_AWS_108 | /cfngoat.yaml | AWS::IAM::Policy.UserPolicy               | Ensure IAM policies does not allow data exfiltration                                                                                                                                                     | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-iam-policies-do-not-allow-data-exfiltration                                              |
| 14 | CKV_AWS_40  | /cfngoat.yaml | AWS::IAM::Policy.UserPolicy               | Ensure IAM policies are attached only to groups or roles (Reducing access management complexity may in-turn reduce opportunity for a principal to inadvertently receive or retain excessive privileges.) | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/iam-16-iam-policy-privileges-1                                                                  |
| 15 | CKV_AWS_107 | /cfngoat.yaml | AWS::IAM::Policy.UserPolicy               | Ensure IAM policies does not allow credentials exposure                                                                                                                                                  | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-iam-policies-do-not-allow-credentials-exposure                                           |
| 16 | CKV_AWS_111 | /cfngoat.yaml | AWS::IAM::Policy.UserPolicy               | Ensure IAM policies does not allow write access without constraints                                                                                                                                      | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-iam-policies-do-not-allow-write-access-without-constraint                                |
| 17 | CKV_AWS_7   | /cfngoat.yaml | AWS::KMS::Key.LogsKey                     | Ensure rotation for customer created CMKs is enabled                                                                                                                                                     | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-logging-policies/logging-8                                                                                   |
| 18 | CKV_AWS_16  | /cfngoat.yaml | AWS::RDS::DBInstance.DefaultDB            | Ensure all data stored in the RDS is securely encrypted at rest                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/general-4                                                                                   |
| 19 | CKV_AWS_17  | /cfngoat.yaml | AWS::RDS::DBInstance.DefaultDB            | Ensure all data stored in RDS is not publicly accessible                                                                                                                                                 | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/public-policies/public-2                                                                                         |
| 20 | CKV_AWS_118 | /cfngoat.yaml | AWS::RDS::DBInstance.DefaultDB            | Ensure that enhanced monitoring is enabled for Amazon RDS instances                                                                                                                                      | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-logging-policies/ensure-that-enhanced-monitoring-is-enabled-for-amazon-rds-instances                         |
| 21 | CKV_AWS_157 | /cfngoat.yaml | AWS::RDS::DBInstance.DefaultDB            | Ensure that RDS instances have Multi-AZ enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/general-73                                                                                  |
| 22 | CKV_AWS_23  | /cfngoat.yaml | AWS::EC2::SecurityGroup.DefaultSG         | Ensure every security groups rule has a description                                                                                                                                                      | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-networking-policies/networking-31                                                                            |
| 23 | CKV_AWS_363 | /cfngoat.yaml | AWS::Lambda::Function.AnalysisLambda      | Ensure Lambda Runtime is not deprecated                                                                                                                                                                  |                                                                                                                                                                                                  |
| 24 | CKV_AWS_173 | /cfngoat.yaml | AWS::Lambda::Function.AnalysisLambda      | Check encryption settings for Lambda environmental variable                                                                                                                                              | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-serverless-policies/bc-aws-serverless-5                                                                      |
| 25 | CKV_AWS_116 | /cfngoat.yaml | AWS::Lambda::Function.AnalysisLambda      | Ensure that AWS Lambda function is configured for a Dead Letter Queue(DLQ)                                                                                                                               | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/ensure-that-aws-lambda-function-is-configured-for-a-dead-letter-queue-dlq                   |
| 26 | CKV_AWS_115 | /cfngoat.yaml | AWS::Lambda::Function.AnalysisLambda      | Ensure that AWS Lambda function is configured for function-level concurrent execution limit                                                                                                              | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/ensure-that-aws-lambda-function-is-configured-for-function-level-concurrent-execution-limit |
| 27 | CKV_AWS_45  | /cfngoat.yaml | AWS::Lambda::Function.AnalysisLambda      | Ensure no hard-coded secrets exist in lambda environment                                                                                                                                                 | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/secrets-policies/bc-aws-secrets-3                                                                                |
| 28 | CKV_AWS_117 | /cfngoat.yaml | AWS::Lambda::Function.AnalysisLambda      | Ensure that AWS Lambda function is configured inside a VPC                                                                                                                                               | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/ensure-that-aws-lambda-function-is-configured-inside-a-vpc-1                                |
| 29 | CKV_AWS_53  | /cfngoat.yaml | AWS::S3::Bucket.DataBucket                | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-19                                                                                         |
| 30 | CKV_AWS_21  | /cfngoat.yaml | AWS::S3::Bucket.DataBucket                | Ensure the S3 bucket has versioning enabled                                                                                                                                                              | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-16-enable-versioning                                                                              |
| 31 | CKV_AWS_55  | /cfngoat.yaml | AWS::S3::Bucket.DataBucket                | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-21                                                                                         |
| 32 | CKV_AWS_56  | /cfngoat.yaml | AWS::S3::Bucket.DataBucket                | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-22                                                                                         |
| 33 | CKV_AWS_18  | /cfngoat.yaml | AWS::S3::Bucket.DataBucket                | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-13-enable-logging                                                                                 |
| 34 | CKV_AWS_54  | /cfngoat.yaml | AWS::S3::Bucket.DataBucket                | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-20                                                                                         |
| 35 | CKV_AWS_20  | /cfngoat.yaml | AWS::S3::Bucket.DataBucket                | Ensure the S3 bucket does not allow READ permissions to everyone                                                                                                                                         | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-1-acl-read-permissions-everyone                                                                   |
| 36 | CKV_AWS_53  | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket          | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-19                                                                                         |
| 37 | CKV_AWS_21  | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket          | Ensure the S3 bucket has versioning enabled                                                                                                                                                              | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-16-enable-versioning                                                                              |
| 38 | CKV_AWS_55  | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket          | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-21                                                                                         |
| 39 | CKV_AWS_56  | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket          | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-22                                                                                         |
| 40 | CKV_AWS_18  | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket          | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-13-enable-logging                                                                                 |
| 41 | CKV_AWS_54  | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket          | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-20                                                                                         |
| 42 | CKV_AWS_53  | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket          | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-19                                                                                         |
| 43 | CKV_AWS_55  | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket          | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-21                                                                                         |
| 44 | CKV_AWS_56  | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket          | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-22                                                                                         |
| 45 | CKV_AWS_18  | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket          | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-13-enable-logging                                                                                 |
| 46 | CKV_AWS_54  | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket          | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-20                                                                                         |
| 47 | CKV_AWS_53  | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket         | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-19                                                                                         |
| 48 | CKV_AWS_55  | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket         | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-21                                                                                         |
| 49 | CKV_AWS_56  | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket         | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-22                                                                                         |
| 50 | CKV_AWS_54  | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket         | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-20                                                                                         |
| 51 | CKV_AWS_53  | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket                | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-19                                                                                         |
| 52 | CKV_AWS_55  | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket                | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-21                                                                                         |
| 53 | CKV_AWS_56  | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket                | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-22                                                                                         |
| 54 | CKV_AWS_18  | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket                | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/s3-13-enable-logging                                                                                 |
| 55 | CKV_AWS_54  | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket                | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/s3-policies/bc-aws-s3-20                                                                                         |
| 56 | CKV_AWS_108 | /cfngoat.yaml | AWS::IAM::Role.CleanupRole                | Ensure IAM policies does not allow data exfiltration                                                                                                                                                     | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-iam-policies-do-not-allow-data-exfiltration                                              |
| 57 | CKV_AWS_111 | /cfngoat.yaml | AWS::IAM::Role.CleanupRole                | Ensure IAM policies does not allow write access without constraints                                                                                                                                      | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-iam-policies/ensure-iam-policies-do-not-allow-write-access-without-constraint                                |
| 58 | CKV_AWS_363 | /cfngoat.yaml | AWS::Lambda::Function.CleanBucketFunction | Ensure Lambda Runtime is not deprecated                                                                                                                                                                  |                                                                                                                                                                                                  |
| 59 | CKV_AWS_116 | /cfngoat.yaml | AWS::Lambda::Function.CleanBucketFunction | Ensure that AWS Lambda function is configured for a Dead Letter Queue(DLQ)                                                                                                                               | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/ensure-that-aws-lambda-function-is-configured-for-a-dead-letter-queue-dlq                   |
| 60 | CKV_AWS_115 | /cfngoat.yaml | AWS::Lambda::Function.CleanBucketFunction | Ensure that AWS Lambda function is configured for function-level concurrent execution limit                                                                                                              | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/ensure-that-aws-lambda-function-is-configured-for-function-level-concurrent-execution-limit |
| 61 | CKV_AWS_117 | /cfngoat.yaml | AWS::Lambda::Function.CleanBucketFunction | Ensure that AWS Lambda function is configured inside a VPC                                                                                                                                               | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-general-policies/ensure-that-aws-lambda-function-is-configured-inside-a-vpc-1                                |
| 62 | CKV_AWS_58  | /eks.yaml     | AWS::EKS::Cluster.EKSCluster              | Ensure EKS Cluster has Secrets Encryption Enabled                                                                                                                                                        | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/aws-policies/aws-kubernetes-policies/bc-aws-kubernetes-3                                                                      |

---
### secrets scan results:

|    | check_id     | file          | resource                                 | check_name                 | guideline                                                                                                              |
|----|--------------|---------------|------------------------------------------|----------------------------|------------------------------------------------------------------------------------------------------------------------|
|  0 | CKV_SECRET_2 | /cfngoat.yaml | fc3f784491eba6121c3bfcc1652a2c57d27b16cb | AWS Access Key             | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/secrets-policies/secrets-policy-index/git-secrets-2 |
|  1 | CKV_SECRET_6 | /cfngoat.yaml | c00f1a6e4b20aa64691d50781b810756d6254b8e | Base64 High Entropy String | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/secrets-policies/secrets-policy-index/git-secrets-6 |
|  2 | CKV_SECRET_2 | /cfngoat.yaml | 25910f981e85ca04baf359199dd0bd4a3ae738b6 | AWS Access Key             | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/secrets-policies/secrets-policy-index/git-secrets-2 |
|  3 | CKV_SECRET_6 | /cfngoat.yaml | d70eab08607a4d05faa2d0d6647206599e9abc65 | Base64 High Entropy String | https://docs.prismacloud.io/en/enterprise-edition/policy-reference/secrets-policies/secrets-policy-index/git-secrets-6 |

---
### github_actions scan results:

|    | check_id   | file                                | resource                                | check_name                                                                                                                                                                        | guideline   |
|----|------------|-------------------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
|  0 | CKV_GHA_7  | /.github/workflows/jit-security.yml | on(Workflows generated by the MVS plan) | The build output cannot be affected by user parameters other than the build entry point and the top-level source location. GitHub Actions workflow_dispatch inputs MUST be empty. |             |
|  1 | CKV2_GHA_1 | /.github/workflows/checkov.yaml     | on(build)                               | Ensure top-level permissions are not set to write-all                                                                                                                             |             |
|  2 | CKV2_GHA_1 | /.github/workflows/main.yaml        | on(checkov-scan)                        | Ensure top-level permissions are not set to write-all                                                                                                                             |             |

---

