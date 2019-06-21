#!/bin/bash

#SBATCH --time=00:05:00
#SBATCH --output=cron.log
#SBATCH --open-mode=append

# Specify a valid Cron string for the schedule. This specifies that
# the Cron job run once per day at 5:15a.
SCHEDULE='15 5 * * *'

# Here is an example of a simple command that prints the host name and
# the date and time.
echo "Hello on $(hostname) at $(date)."

# This schedules the next run.
sbatch --quiet --begin=$(next-cron-time "$SCHEDULE") cron.sbatch