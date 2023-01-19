resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "my-state-machine-gordito"
  role_arn = "arn:aws:iam::042670738437:role/service-role/StepFunctions-HelloWorld-role-ce33da71"

  definition = <<EOF
{
  "Comment": "A description of my state machine",
  "StartAt": "CreateBucket",
  "States": {
    "CreateBucket": {
      "Type": "Task",
      "Parameters": {
        "Bucket": "MyData"
      },
      "Resource": "arn:aws:states:::aws-sdk:s3:createBucket",
      "Next": "DeleteBucket"
    },
    "DeleteBucket": {
      "Type": "Task",
      "Parameters": {
        "Bucket": "MyData"
      },
      "Resource": "arn:aws:states:::aws-sdk:s3:deleteBucket",
      "Next": "Choice"
    },
    "Choice": {
      "Type": "Choice",
      "Choices": [
        {
          "Next": "Glue StartJobRun"
        }
      ],
      "Default": "ECS RunTask"
    },
    "Glue StartJobRun": {
      "Type": "Task",
      "Resource": "arn:aws:states:::glue:startJobRun",
      "Parameters": {
        "JobName": "myJobName"
      },
      "Next": "DescribeJournalS3Export"
    },
    "DescribeJournalS3Export": {
      "Type": "Task",
      "Parameters": {
        "ExportId": "MyData",
        "Name": "MyData"
      },
      "Resource": "arn:aws:states:::aws-sdk:qldb:describeJournalS3Export",
      "Next": "SendEmail"
    },
    "SendEmail": {
      "Type": "Task",
      "End": true,
      "Parameters": {
        "Destination": {},
        "Message": {
          "Body": {},
          "Subject": {
            "Data": "MyData"
          }
        },
        "Source": "MyData"
      },
      "Resource": "arn:aws:states:::aws-sdk:ses:sendEmail"
    },
    "ECS RunTask": {
      "Type": "Task",
      "Resource": "arn:aws:states:::ecs:runTask",
      "Parameters": {
        "LaunchType": "FARGATE",
        "Cluster": "arn:aws:ecs:REGION:ACCOUNT_ID:cluster/MyECSCluster",
        "TaskDefinition": "arn:aws:ecs:REGION:ACCOUNT_ID:task-definition/MyTaskDefinition:1"
      },
      "Next": "ListLedgers"
    },
    "ListLedgers": {
      "Type": "Task",
      "End": true,
      "Parameters": {},
      "Resource": "arn:aws:states:::aws-sdk:qldb:listLedgers"
    }
  }
}
EOF
}