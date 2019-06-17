#!/bin/bash

target_db_file='/tmp/download_history.db'

### load the function ###
cur_folder=`dirname $0`
lib_folder="$cur_folder/../lib"
. $lib_folder/colorful_print.sh
### end ###

if [ -f $target_db_file ]
then
    ECHO_WARN "File [$target_db_file] already existed, do you want to re-create it?"
    read confirm 
    if [ x"$confirm" == 'xyes' ] || [ x"$confirm" == 'xy' ] || [ x"$confirm" == 'xYes' ] || [ x"$confirm" == 'xY' ] 
    then
        ECHO_INFO "Removing old DB file [$target_db_file]"
        rm -f $target_db_file
        echo "create table download_history (url varchar(255) UNIQUE, status varchar(50));" | sqlite3 $target_db_file
        ECHO_INFO "DB [$target_db_file] created"
    else
        ECHO_ERROR "Cancelled by user, exit..."
        exit 1
    fi
else
    ECHO_INFO "Creating DB [$target_db_file]..."
    echo "create table download_history (url varchar(255), status varchar(50));" | sqlite3 $target_db_file
    ECHO_INFO "DB [$target_db_file created]"
fi
