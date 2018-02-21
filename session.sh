#!/bin/bash
# --------------------------------------------------------------------------------
# document here the main bash commands you are using for the server access.  The file contains
# two parts: the first one for the commands you run on your laptop, and the second one for the
# commands on the remote server.
#
# The question lists give your some guidance what to do and report but you are free to do it
# in a different way.  If you use a graphical frontend instead of scp for copying files,
# just say which one in the appropriate place.
#
# Note: this file does not to be runnable
#
# -------------------- local commands --------------------
# 1. create a directory for this project.
cd ~/Documents/Info\ 201
git clone https://github.com/info201b-wi2018/a6-remote-ashleyz7.git

# 2. log onto the server
ssh zhouy58@info201.ischool.uw.edu

# 3. copy the small data subset from the server to your local machine
scp zhouy58@info201.ischool.uw.edu:/opt/data/temp_prec_subset.csv.bz2 /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7

# 4. copy your R-script to the server
scp /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7/maps.R zhouy58@info201.ischool.uw.edu:HW6/

# 5. (after succesfully running the script remotely): copy the output files back to your computer
scp zhouy58@info201.ischool.uw.edu:HW6/Temperature.1960.jpg /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7

scp zhouy58@info201.ischool.uw.edu:HW6/Temperature.1987.jpg /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7

scp zhouy58@info201.ischool.uw.edu:HW6/Temperature.2014.jpg /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7

scp zhouy58@info201.ischool.uw.edu:HW6/Precipitation.1960.jpg /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7

scp zhouy58@info201.ischool.uw.edu:HW6/Precipitation.1987.jpg /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7

scp zhouy58@info201.ischool.uw.edu:HW6/Precipitation.2014.jpg /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7

(OR scp zhouy58@info201.ischool.uw.edu:HW6/* /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7）

# 6. inspect that the copy was successful
ls /Users/ashleyzhou/Documents/INFO\ 201/a6-remote-ashleyz7


# -------------------- remote commands --------------------
# 1. explore the data directory '/opt/data'.  How do you find out the size of the files?
cd /opt/data
ls -l *

# 2. explore the first few lines of the small sample data
pbzip2 -dc temp_prec_small.csv.bz2 | head -4

# 3. create a directory for this project
(cd ..
cd ..）
mkdir HW6

# 4. (after copying your code from the laptop): inspect the files in the project directory
cd HW6
ls

# 5. run your script
Rscript maps.R

# 6. How do you install missing R packages?
R
install.packages("ggplot2")
install.packages("dplyr")
install.packages("data.table")
install.packages("mapproj")
q()
# 7. (after running the script): inspect the folder for output files
ls
