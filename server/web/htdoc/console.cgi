#!/usr/bin/perl
# management console for remote download
use strict;
use Data::Dumper;
use CGI;
# use CGI::Session;
my ( $scriptFolder, $libFolder); BEGIN { chomp($scriptFolder = `dirname $0`); $libFolder="$scriptFolder/../lib";}; 
use lib "$libFolder";
use RemoteDownload;

my $cgi = CGI->new;

### HTML metadata ###
print $cgi->header;
print $cgi->start_html( -title=>'MiRoute Download list',
        -style=>{-src=>'/css/test.css'}
);
#print qq(<link rel="stylesheet" href="/market/css/normalize.css">);


print qq(
<div class="backgroud">
    <div class='title'>
    MiRoute Job list
    </div>
);


### generate the table ###
&get_download_report();

### HTML code for management form ###
&add_new_jobs_form();


print qq(</dev>);


sub add_new_jobs_form
{
    print qq(
<p>To add some new jobs...</p>

<form action="./bin/add_new_jobs.cgi">
  <textarea name="urls" rows="10" cols="100">URL please...</textarea>
  <br>
  <input type="submit">
</form>
);
}



sub get_download_report
{
    print qq(
<div class="jobList">
<table>
    <tr>
        <th>ID</th>
        <th>URL</th>
        <th>Status</th>
        <th>Created</th>
    </tr>
);

    my $all_url = RemoteDownload->get_download_list;
    foreach my $line (split /\n/,$all_url )
    {
        # RemoteDownload->HTML_DEBUG($line);
        my ($id,$url,$status,$ctime) = split /\|/, $line;
        print qq(
    <tr>
        <td>$id</td>
        <td>$url</td>
        <td>$status</td>
        <td>$ctime</td>
    </tr>);
    }
    print qq(
</table>
</div>
);
}

