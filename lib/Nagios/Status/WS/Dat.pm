package Nagios::Status::WS::Dat;
use Dancer2 ':syntax';
use Moose;
use Nagios::StatusLog;

has status_log => (
    is       => 'ro',
    isa      => 'Nagios::StatusLog',
    lazy     => 1,
    builder  => '_build_status_dat',
);

sub _build_status_dat {
    my $self = shift;
    my $log = Nagios::StatusLog->new(
                   Filename => config->{nagios}->{filename},
                   Version  => config->{nagios}->{version},
              );
}

sub host_service_stat {
    my ( $self, $host, $service )  = @_;
    my $svc_stat = $self->status_log->service( $host, $service );
    return {
        'status' => $svc_stat->status,
        'status_information' => $svc_stat->plugin_output,
        'performance' => $svc_stat->performance_data,
        'last_check' => $svc_stat->last_check,
    };
}

1;
