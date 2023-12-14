# Server-Wake-Up-Scheduler
script puts server to sleep and wakes at specified time

## Prerequisites
- Made for Unraid server with UserScript Plugin but will run on any Linux operating system with `rtcwake` command & sudo privileges.

## Usage

1. **Setting Wake-Up Time**
   Edit the script and specify the wake-up time in the 24-hour format at the top of the script:
   Below would wake server at 16:18 or 4:18 pm
   ```time="16:18" # Set your desired wake-up time for your server here```



## What script does

    Fetches the current system time and the user-specified wake-up time.
    Calculates the time difference in seconds.
    Adjusts for next-day wake-up times if necessary.
    Uses rtcwake to sleep the server until the specified time.
