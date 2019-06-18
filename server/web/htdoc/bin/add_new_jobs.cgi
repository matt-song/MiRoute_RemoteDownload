#!/usr/bin/perl
# Use this script to add new jobs for remote download
use strict;
use Data::Dumper;
use CGI;

#### load the function, must set the variable at begin stage, see https://stackoverflow.com/questions/13950637/how-do-you-use-a-variable-in-lib-path/13950813 ###
my ( $scriptFolder, $libFolder); BEGIN { chomp($scriptFolder = `dirname $0`); $libFolder="$scriptFolder/../../lib";}; 
use lib "$libFolder";
use RemoteDownload;

my $cgi = CGI->new;
print $cgi->header;
#print $cgi->header(-charset=>'utf-8');

# Get POST value
my $url_list = $cgi->param("urls");
RemoteDownload->HTML_DEBUG($url_list);