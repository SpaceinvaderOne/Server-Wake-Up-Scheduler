#!/bin/bash
#set -x
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# #   Script for sleeping then waking your server at a specific time                                                                                                        # #
# #   by - SpaceInvaderOne                                                                                                                # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#
#  fill in the below
#
# put below the wake-up time in 24-hour format (HH:MM) at which you want the server to wake
time="16:18"
#
# Dont edit below this line
#
# Get the current system time now in 24-hour clock format 
current_time=$(date +%H:%M)
echo "$current_time"
# Extract hours and minutes from the current and wake time
current_hours=${current_time%%:*}
current_minutes=${current_time#*:}

target_hours=${time%%:*}
target_minutes=${time#*:}

echo "Wakeup planned at $target_hours:$target_minutes"

# Calculate the time difference in seconds
current_seconds=$((current_hours * 3600 + current_minutes * 60))
target_seconds=$((10#$target_hours * 3600 + 10#$target_minutes * 60))
time_diff_seconds=$((target_seconds - current_seconds))

# Check if the target time is earlier than the current time (example for next day wake-up)
if [ $time_diff_seconds -le 0 ]; then
    # Adjust for wake-up time if its on the next day
    time_diff_seconds=$((time_diff_seconds + 86400))  # 86400 seconds in a day
fi

# Calculate hours and minutes until wake-up
hours_until_wake=$((time_diff_seconds / 3600))
minutes_until_wake=$(( (time_diff_seconds % 3600) / 60))

echo "Hours until $time: $hours_until_wake hours and $minutes_until_wake minutes"
echo "I will wake in $time_diff_seconds seconds"
# run the rtcwake command in the seconds until time
sudo rtcwake -m mem -s $time_diff_seconds
