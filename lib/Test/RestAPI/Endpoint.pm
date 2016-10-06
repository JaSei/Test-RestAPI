package Test::RestAPI::Endpoint;
use Moo;

use parent 'Exporter';

our @EXPORT_OK = qw(convert_path_to_filename);

=head1 NAME

Test::RestAPI::Endpoint - API endpoint

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 FUNCTIONS

=head2 convert_path_to_filename($path)

=cut
sub convert_path_to_filename {
    my ($path) = @_;

    $path =~ s/\W+/_/g;

    return $path;
}

=head1 METHODS

=head2 new(%attribute)

=head3 %attribute

=head4 endpoint



=cut

has 'path' => (
    is => 'ro',
);

has 'method' => (
    is => 'ro',
);

has 'render' => (
    is => 'ro',
);

=head2 render_as_string

=cut
sub render_as_string {
    my ($self) = @_;

    my @ret;
    while (my ($k,$v) = each %{$self->render}) {
        push @ret, sprintf '%s => "%s"', $k, $v;
    }

    return join ',', @ret;
}

=head2 path_as_filename

=cut
sub path_as_filename {
    my ($self) = @_;

    return convert_path_to_filename($self->path);
}



=head1 LICENSE

Copyright (C) Avast Software.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Jan Seidl E<lt>seidl@avast.comE<gt>

=cut

1;

