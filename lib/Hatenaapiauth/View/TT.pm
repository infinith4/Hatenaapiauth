package Hatenaapiauth::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

Hatenaapiauth::View::TT - TT View for Hatenaapiauth

=head1 DESCRIPTION

TT View for Hatenaapiauth.

=head1 SEE ALSO

L<Hatenaapiauth>

=head1 AUTHOR

th4,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
