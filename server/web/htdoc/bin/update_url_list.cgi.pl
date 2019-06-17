#!/usr/bin/perl
# Use this script to generate the html page to url list for MiRoute to donwload

use strict;
use Data::Dumper;
use CGI;

#### load the function, must set the variable at begin stage, see https://stackoverflow.com/questions/13950637/how-do-you-use-a-variable-in-lib-path/13950813 ###
my ( $scriptFolder, $libFolder); BEGIN { chomp($scriptFolder = `dirname $0`); $libFolder="$scriptFolder/../../lib";}; 
use lib "$libFolder";
use RemoteDownload;

my $job_list_file = "$scriptFolder/../job_list.html";

### Start working here ###
open HTML,'>',$job_list_file or do {RemoteDownload->HTML_ERROR("Unable to write html file [$job_list_file], exit!"); exit 1};
my $all_url = RemoteDownload->get_download_list;

foreach my $line (split /\n/,$all_url )
{
    # print "The line is $line \n";
    my ($id,$url,$status) = split /\|/, $line;
    print HTML "$url\n";
}
close HTML;

