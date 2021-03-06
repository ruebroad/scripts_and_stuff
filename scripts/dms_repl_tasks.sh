
#!/bin/bash

ACC_ID=$(aws sts get-caller-identity | jq -r '.Account')
REGION="eu-west-1"
PRD="571943706434"
ACC="197082791059"

ACTION=$1 # expecting "start" or "stop"
if [ $ACTION != "stop" ]; then
  if [ $ACTION != "start" ]; then
    echo "Action $ACTION is unknown. Exiting"
    exit 1
  fi
fi

if [ $ACC_ID == $ACC ]; then
  ACCOUNT="ACC"
elif [ $ACC_ID == $PRD ]; then
  ACCOUNT="PRD"
else 
  echo "Unknown account"
  exit 1
fi

echo "************************************************************************************"
echo "You're performing actions in ***${ACCOUNT}***"
echo "Are you sure you want to ***${ACTION}*** ALL DMS replication tasks in this account?"
echo "************************************************************************************"
read -rsp $'Press any key to continue...\n' -n1 key


# Reload options = start-replication, resume-processing, reload-target
RELOAD_OPTION_CONTACT="reload-target"
RELOAD_OPTION_PERFGRAPH="resume-processing"
RELOAD_OPTION_C_VS_A="resume-processing"
RELOAD_OPTION_DATALAKE="resume-processing"



task_arns=$(aws dms describe-replication-tasks --without-settings --region eu-west-1 --query "ReplicationTasks[*].ReplicationTaskArn" | jq -r '.[]')
for arn in $task_arns; do 
  repl_task=$(aws dms describe-replication-tasks --without-settings --region eu-west-1 --filter Name=replication-task-arn,Values="$arn" --query "ReplicationTasks[*].ReplicationTaskIdentifier" | jq -r '.[]')
  if [ $ACTION == "stop" ]; then
    echo "Stopping Task $arn for $repl_task"
    aws dms stop-replication-task --replication-task-arn $arn --region eu-west-1
  fi

  if [ $ACTION == "start" ]; then
    # Performance Graph replication tasks
    if [[ $repl_task == performance* ]]; then
      RELOAD_OPTION=$RELOAD_OPTION_PERFGRAPH
    # Contact_vs_account replication task
    elif [[ $repl_task == contactvsaccount* ]]; then
      RELOAD_OPTION=$RELOAD_OPTION_C_VS_A
    # Contact replication tasks
    elif [[ $repl_task == contactrepl* ]]; then
      RELOAD_OPTION=$RELOAD_OPTION_CONTACT
    # Contact replication tasks
    elif [[ $repl_task == datelake* ]]; then
      RELOAD_OPTION=$RELOAD_OPTION_DATALAKE
      
    else
      echo "Unexpected replication task name"
      echo "Task arn: $arn"
      echo "Task id: $repl_task"
      exit 1
    fi
    # Start the replication task
    echo "$RELOAD_OPTION Task $arn for $repl_task"
    # aws dms start-replication-task --replication-task-arn $arn --region eu-west-1 --start-replication-task-type $RELOAD_OPTION
  fi
done
