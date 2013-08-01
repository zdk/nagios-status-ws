use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on it.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME                => 'Nagios::Status::WS',
    AUTHOR              => q{zdk <nx2zdk@mgial.com>},
    VERSION_FROM        => 'lib/Nagios/Status/WS.pm',
    ABSTRACT            => 'Webservice endpoint for Nagios',
    ($eumm_version >= 6.3001
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer2'     => 0.06,
        'Nagios::StatusLog' => 44,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Nagios-Status-WS-*' },
);
