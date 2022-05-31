The CISA Security Bulletin python script I created downloads the html from the most recent CISA vulnerability summary,
enabling you to view the contents without visiting the website manually.

You can run the python program either in the CLI, or by editing the .bat file to point to the location
of the python script in your file system.

I recommend setting up a Windows Task Scheduler task and having it execute once a weekly to get the report
without requiring any user interaction. Each vulnerability summary is released on Monday, so you can 
have it execute in the afternoon to get the latest vulnerability report downloaded to your computer.
