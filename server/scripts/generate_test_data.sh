#!/bin/bash

target_db_file='/data/download_history.db'

echo "insert into download_history(url,status) values ('test_url#1', 'failed');" | sqlite3 $target_db_file
echo "insert into download_history(url,status) values ('test_url#2', 'failed');" | sqlite3 $target_db_file
echo "insert into download_history(url,status) values ('test_url#3', 'failed');" | sqlite3 $target_db_file
echo "insert into download_history(url,status) values ('test_url#4', 'failed');" | sqlite3 $target_db_file
echo "insert into download_history(url,status) values ('test_url#5', 'failed');" | sqlite3 $target_db_file
echo "insert into download_history(url,status) values ('test_url#6', 'failed');" | sqlite3 $target_db_file
echo "insert into download_history(url,status) values ('test_url#7', 'failed');" | sqlite3 $target_db_file
echo "insert into download_history(url,status) values ('test_url#8', 'failed');" | sqlite3 $target_db_file
