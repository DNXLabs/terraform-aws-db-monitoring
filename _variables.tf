variable "identifier" {
  default     = ""
  description = "RDS database instance identifier"
}

variable "alarm_sns_topics" {
  default     = []
  description = "Alarm topics to create and alert on RDS instance metrics"
}