# Import Module
use Nagios::Status::Service;
 
# Instantiate the Service object.
#my $serv = Nagios::Status::Service->new($nagios_status_log_path);
    # OR
my $serv = Nagios::Status::Service->new('/usr/local/var/lib/nagios/nagios.log','localhost');
 
# You can set single attributes.
#$serv->set_attribute('hostname=testserver');
 
# You can get single attributes.
my $attr = $serv->get_attribute('host_name');
    # OR
#my $attr = $serv->get_attribute('all');
 
# Check if service is warning, unknown, critical, or up.
if ($serv->is_warning) {
    print 'Service is warning...';
} elsif ($serv->is_unknown) {
    print 'Service is unknown...';
} elsif ($serv->is_critical) {
    print 'Service is critical...';
} else {
    print 'Service is up...';
}
 
# Simple method for obtaining hostname
my $name = $serv->get_hostname;
 
# Get warning time
my $warning_time = $serv->get_warning_time if $serv->is_warning;
 
# Get unknown time
my $unknown_time = $serv->get_unknown_time if $serv->is_unknown;
 
# Get critical time
my $critical_time = $serv->get_critical_time if $serv->is_critical;
