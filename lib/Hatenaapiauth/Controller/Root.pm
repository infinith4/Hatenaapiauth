package Hatenaapiauth::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

Hatenaapiauth::Controller::Root - Root Controller for Hatenaapiauth

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

    use Hatena::API::Auth;

    my $api = Hatena::API::Auth->new({
        api_key => '842181e96588884ded2cc99e37c58473',
        secret  => '7f8551a7a4a17494',
                                     });

sub login :Path('/hatena/login') {
    my ($self,$c) = @_;

    use Data::Dumper;
    my $uri = $api->uri_to_login;
    print Dumper $uri;
    print Dumper $uri->as_string;
    $c->response->redirect($uri->as_string);
    
}
sub auth :Path('/hatena/auth'){
    my ($self,$c) = @_;
    my $cert = $c->req->param('cert');
    my $user = $api->login($cert) or die "Couldn't login: " . $api->errstr;
    print Dumper $user;
    #$user->name;
    #$user->image_url;
    #$user->thumbnail_url;
}
=head1 AUTHOR

th4,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
