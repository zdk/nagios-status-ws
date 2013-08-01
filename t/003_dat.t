use Test::More tests => 1;
use strict;
use warnings;

use_ok 'Nagios::Status::WS::Dat';


my $dat = Nagios::Status::WS::Dat->new();

use Data::Dump qw/dump/;
diag dump $dat->host_service_stat('localhost','HTTP');

