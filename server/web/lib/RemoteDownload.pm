#!/usr/bin/perl
package RemoteDownload;
use strict;
use Data::Dumper;
use CGI;

my $DB = "/tmp/download_history.db";
my $DEBUG = 1;
my $_SQLITE="/usr/bin/sqlite3";

## print the debug message.
sub HTML_DEBUG
{
    my ($self, $message) = @_;
    print "<pre>\n$message\n</pre>\n";    
    return 0;
}

sub HTML_ERROR
{
    my ($self, $message) = @_;
    print qq(<font size="4" color="red">$message</font>\n);    
    return 0;
}

sub get_download_list
{
    my $sqlCMD = qq(select ROWID,* from download_history;);
    HTML_DEBUG('self', "the sql command is [$sqlCMD]") if $DEBUG;
    &executeSQL('self', $sqlCMD);
}

### common function for execute SQL command
sub executeSQL
{
    my ($self, $sqlCMD) = @_;
   
    my $bashCMD = qq($_SQLITE $DB "$sqlCMD" 2>&1);
    HTML_DEBUG('self',"the bash command is [$bashCMD]") if $DEBUG;
    
    chomp(my $output = `$bashCMD`);
    
    if ($?)
    {
        HTML_ERROR('self', "Failed to update DB with command [$sqlCMD], error [$output], please check!");
        return 1;
    }
    else
    {
        return $output;
    }

}
