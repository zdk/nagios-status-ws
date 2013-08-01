package Nagios::Status::WS;
use Dancer2 ':syntax';
use JSON;

use Nagios::Status::WS::Dat;

our $VERSION = '0.1';

set serializer => 'JSON';

get '/:host/:service' => sub {
    print config->{log};
    my $nagios_dat = Nagios::Status::WS::Dat->new();
    return $nagios_dat->host_service_stat( params->{host}, uc(params->{service}) );
};

get qr{^/user/(?<id>\d+)\.(?<format>\w+)} => sub {
    #
};

get '/' => sub {
    template 'index';
};

true;
