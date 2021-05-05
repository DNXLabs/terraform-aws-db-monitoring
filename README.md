# terraform-aws-db-monitoring

[![Lint Status](https://github.com/DNXLabs/terraform-aws-db-monitoring/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-db-monitoring/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-db-monitoring)](https://github.com/DNXLabs/terraform-aws-db-monitoring/blob/master/LICENSE)

This terraform module is responsible for monitoring a Relational Database Service(RDS) database.

The following resources will be created:
 - Cloudwatch alarms
   - To monitor whether the Database instance memory is above the threshold
   - To monitor whether the Database instance CPU is above the threshold

In addition you have the option to :
 - Create or not a Simple Notification Service topic (SNS) - This SNS create alerts on RDS instances metrics.

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_name | Name of the AWS account to identify the alarms | `string` | `""` | no |
| alarm\_sns\_topics | Alarm topics to create and alert on RDS instance metrics | `list` | `[]` | no |
| identifier | RDS database instance identifier | `string` | `""` | no |
| instance\_class | RDS database instance class | `any` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Author

Module managed by [DNX Solutions](https://github.com/DNXLabs).


## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-db-monitoring/blob/master/LICENSE) for full details.
