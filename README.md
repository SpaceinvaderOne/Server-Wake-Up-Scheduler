## Prerequisites
- Made for Unraid servers with UserScript Plugin, but will run on any Linux operating system with `rtcwake` command and sudo privileges.

## Usage

 **Setting Wake-Up Time**
   Edit the script and specify the wake-up time in the 24-hour format at the top of the script:
   The example below would wake the server at 16:18 or 4:18 PM.
   
   

    time="16:18" # Set your desired wake-up time for your server here



## What script does

-   The script fetches the current system time and the user-specified wake-up time.
-   It calculates the difference in seconds between these two times.
-   If the specified time is on the next day, it automatically adjusts the calculation.
-   Then, it uses `rtcwake` to put the server to sleep until the specified time.

## Important Notes

-   Ensure that your server supports the S3 (suspend to RAM) sleep state.
-   Misconfiguration or incorrect time settings might lead to unexpected behavior ie not waking up at correct time !!
