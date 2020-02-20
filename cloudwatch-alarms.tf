resource "aws_cloudwatch_metric_alarm" "high_memory" {
  alarm_name                = "${data.aws_iam_account_alias.current.account_alias}-db-${var.identifier}-high-memory"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "MemoryUtilization"
  namespace                 = "AWS/RDS"
  period                    = "600"
  statistic                 = "Maximum"
  threshold                 = "80"
  alarm_description         = "Database instance memory above threshold"
  alarm_actions             = var.alarm_sns_topics
  ok_actions                = var.alarm_sns_topics

  dimensions = {
    DBInstanceIdentifier = var.identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name                = "${data.aws_iam_account_alias.current.account_alias}-db-${var.identifier}-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/RDS"
  period                    = "600"
  statistic                 = "Maximum"
  threshold                 = "80"
  alarm_description         = "Database instance CPU above threshold"
  alarm_actions             = var.alarm_sns_topics
  ok_actions                = var.alarm_sns_topics

  dimensions = {
    DBInstanceIdentifier = var.identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "low_disk" {
  alarm_name                = "${data.aws_iam_account_alias.current.account_alias}-db-${var.identifier}-low-disk"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "FreeStorageSpace"
  namespace                 = "AWS/RDS"
  period                    = "600"
  statistic                 = "Maximum"
  threshold                 = "1000000000"
  unit                      = "Bytes"
  alarm_description         = "Database instance disk space is low"
  alarm_actions             = var.alarm_sns_topics
  ok_actions                = var.alarm_sns_topics

  dimensions = {
    DBInstanceIdentifier = var.identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "low_cpu_credits" {
  count = substr(data.aws_db_instance.current.db_instance_class,0,4) == "db.t" ? 1 : 0

  alarm_name                = "${data.aws_iam_account_alias.current.account_alias}-db-${var.identifier}-low-cpu-credits"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "CPUCreditBalance"
  namespace                 = "AWS/RDS"
  period                    = "600"
  statistic                 = "Maximum"
  threshold                 = "100"
  alarm_description         = "Database instance CPU credit balance is low"
  alarm_actions             = var.alarm_sns_topics
  ok_actions                = var.alarm_sns_topics

  dimensions = {
    DBInstanceIdentifier = var.identifier
  }
}

# resource "aws_cloudwatch_metric_alarm" "read_latency" {
#   alarm_name                = "${data.aws_iam_account_alias.current.account_alias}-db-${var.identifier}-read-latency"
#   comparison_operator       = "LessThanLowerOrGreaterThanUpperThreshold"
#   # evaluation_periods        = "3"
#   threshold                 = "0"
#   # datapoints_to_alarm       = "2"
#   metric_query {
#     id = "ad1"
#     label = "ReadLatency (expected)"
#     return_data = true
#     expression = "ANOMALY_DETECTION_BAND(m1, 2)"
#   }
#   metric_query {
#     id = "m1"

#     metric {
#       metric_name = "ReadLatency"
#       namespace   = "AWS/RDS"
#       period      = "600"
#       stat        = "Average"

#       dimensions = {
#         DBInstanceIdentifier = var.identifier
#       }
#     }
#   }
#   threshold_metric_id = "ad1"
#   treat_missing_data        = "missing"
#   alarm_description         = "Database instance read latency"
#   alarm_actions             = var.alarm_sns_topics
#   ok_actions                = var.alarm_sns_topics
# }
