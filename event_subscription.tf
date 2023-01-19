resource "aws_db_event_subscription" "rds_events" {
  count     =  length(var.identifier) > 0 ? 1 : 0
  name      = "${var.account_name}-${var.identifier}-rds-event-sub"
  sns_topic = var.alarm_sns_topics

  source_type = "db-instance"
  source_ids  = [var.identifier]
  
  event_categories = split(",",var.event_categories)
}