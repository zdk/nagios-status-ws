use strict;
use warnings;
use Test::More tests => 2;
use FindBin qw($Bin);
use lib "$Bin/../lib";

use_ok 'Nagios::Status::WS::Dat';


my $dat = Nagios::Status::WS::Dat->new(
            nagios_filename => $Bin . '/../t/lib/data/status.dat',
            nagios_version => 3.0,
          );

{
    my $service = $dat->host_service_stat('localhost','HTTP');
    is($service->{status}, "OK", "Service has OK status");
}

{
    my $service = $dat->host_service_stat('localhost','Swap+Usage');
    use Data::Dump qw/dump/;
    dump $service;
}

