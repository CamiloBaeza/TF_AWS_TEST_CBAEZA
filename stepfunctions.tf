resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "my-state-machine-gordito"
  role_arn = "arn:aws:iam::042670738437:role/service-role/StepFunctions-HelloWorld-role-ce33da71"

  definition = <<EOF
{
  "Comment": "An example of using Athena to query logs, get query results and send results through notification.",
  "StartAt": "Generate example log",
  "States": {
    "Generate example log": {
      "Resource": "<GENERATE_LOG_LAMBDA_FUNCTION_ARN>",
      "Type": "Task",
      "Next": "Run Glue crawler"
    },
    "Run Glue crawler": {
      "Resource": "<INVOKE_CRAWLER_LAMBDA_FUNCTION_ARN>",
      "Type": "Task",
      "Next": "Start an Athena query"
    },
    "Start an Athena query": {
      "Resource": "arn:aws:states:::athena:startQueryExecution.sync",
      "Parameters": {
        "QueryString": "<ATHENA_QUERY_STRING>",
        "WorkGroup": "<ATHENA_WORKGROUP>"
      },
      "Type": "Task",
      "Next": "Get query results"
    },
    "Get query results": {
      "Resource": "arn:aws:states:::athena:getQueryResults",
      "Parameters": {
        "QueryExecutionId.$": "$.QueryExecution.QueryExecutionId"
      },
      "Type": "Task",
      "Next": "Send query results"
    },
    "Send query results": {
      "Resource": "arn:aws:states:::sns:publish",
      "Parameters": {
        "TopicArn": "<SNS_TOPIC_ARN>",
        "Message": {
          "Input.$": "$.ResultSet.Rows"
        }
      },
      "Type": "Task",
      "End": true
    }
  }
}
EOF
}