package Devel::Confess::Patch::UseDataDumpObjectAsString;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
no warnings;

use Module::Patch;
use base qw(Module::Patch);

our %config;

sub patch_data {
    return {
        v => 3,
        patches => [
            {
                action      => 'replace',
                #mod_version => qr/^/,
                sub_name    => '_ref_formatter',
                code        => sub {
                    require Data::Dump::ObjectAsString;
                    local $SIG{__WARN__} = sub {};
                    local $SIG{__DIE__} = sub {};
                    Data::Dump::ObjectAsString::dump($_[0]);
                },
            },
        ],
   };
}

1;
# ABSTRACT: Use Data::Dump::ObjectAsString to stringify reference

=for Pod::Coverage ^()$

=head1 SYNOPSIS

 % PERL5OPT=-MDevel::Confess::Patch::UseDataDumpObjectAsString -MDevel::Confess=dump yourscript.pl


=head1 DESCRIPTION


=head1 SEE ALSO

L<Data::Dump::ObjectAsString>
