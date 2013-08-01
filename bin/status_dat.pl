use Nagios::StatusLog;

my $log = Nagios::StatusLog->new(
               Filename => "/usr/local/var/lib/nagios/status.dat",
               Version  => 3.0
          );

my $svc_stat = $log->service( "localhost", "HTTP" );

use Data::Dump qw/dump/;
print dump $svc_stat;
print "\n";
printf "Status: %s \n", $svc_stat->status;
printf "Status Information: %s \n", $svc_stat->plugin_output;
printf "Performance: %s \n", $svc_stat->performance_data;
printf "Last Check: %s \n", scalar(localtime($svc_stat->last_check));
