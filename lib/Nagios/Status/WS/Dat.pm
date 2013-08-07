package Nagios::Status::WS::Dat;
use Dancer2 ':syntax';
use Moose;
use Nagios::StatusLog;

has 'status_log' => (
    is       => 'ro',
    isa      => 'Nagios::StatusLog',
    lazy     => 1,
    builder  => '_build_status_dat',
);

has 'nagios_filename' => (
    is  => 'rw',
    isa => 'Str',
);

has 'nagios_version' => (
    is  => 'rw',
    isa => 'Str',
);

sub _build_status_dat {
    my $self = shift;
    my $log = Nagios::StatusLog->new(
                   Filename => $self->nagios_filename || config->{nagios}->{filename},
                   Version  => $self->nagios_version || config->{nagios}->{version},
              );
}

sub host_service_stat {
    my ( $self, $host, $service )  = @_;
    my @name = split /\+/, $service;
    if ( @name > 1 ) {
        $service = ucfirst $name[0] . " " . ucfirst $name[1];
    } else {
        $service = uc $name[0];
    }
    my $svc_stat = $self->status_log->service( $host, $service );
    return {
        'status' => $svc_stat->status,
        'status_information' => $svc_stat->plugin_output,
        'performance' => $svc_stat->performance_data,
        'last_check' => $svc_stat->last_check,
    };
}

1;
