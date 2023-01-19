resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "my-state-machine-gordito"
  role_arn = "arn:aws:iam::042670738437:role/service-role/StepFunctions-HelloWorld-role-ce33da71"

  definition = <<EOF
{
  "Comment": "An example of the Amazon States Language for scheduling a task.",
  "StartAt": "Wait for Timestamp",
  "States": {
    "Wait for Timestamp": {
      "Type": "Wait",
      "SecondsPath": "$.timer_seconds",
      "Next": "Send SNS Message"
    },
    "Send SNS Message": {
      "Type": "Task",
      "Resource": "arn:<PARTITION>:lambda:::function:SendToSNS",
      "Retry": [
        {
          "ErrorEquals": [
            "States.ALL"
          ],
          "IntervalSeconds": 1,
          "MaxAttempts": 3,
          "BackoffRate": 2
        }
      ],
      "End": true
    }
  }
}
EOF
}