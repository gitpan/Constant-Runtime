package Constant::Runtime;

use strict;
use warnings;

our $VERSION = '0.01';

our $AUTHORITY = 'cpan:BERLE';

my $count;

sub make_anon {
  my ($class,$value) = @_;

  $count++;

  return $class->make ("$class\::_constant_$count",$value);
}

sub make {
  my ($class,$name,$value) = @_;

  $name = caller ()."::$name"
    unless $name =~ m/::/;

  {
    no strict qw/refs/;

    *{$name} = sub () { $value };
  }

  return "$name()";
}

1;

__END__

=head1 NAME

Constant::Runtime - Generates constants at runtime

=head1 SYNOPSIS

  use Constant::Runtime;

  Constant::Runtime->make ("Foo",42);

  print Foo();

  Constant::Runtime->make ("Foo::Bar",42);

  print Foo::Bar();

  my $constant = Constant::Runtime->make_anon (42);

  print eval "$constant";

=head1 DESCRIPTION

This module was born as a tool to generate constants for optimizing
runtime code evaluation for L<MooseX::Method>. Feel free to use it for
whatever you can imagine though.

=head1 METHODS

=over 4

=item make ($constant_name,$value)

  Constant::Runtime->make ("Foo",42);

This will make a constant in the calling class by the name "Foo".

  Constant::Runtime->make ("Someclass::Constant",42)

This will make a constant in the specified class by the name "Foo".

=item make_anon ($value)

  my $anonymous_constant = Constant::Runtime->make_anon (42);

Used for generating an anonymous constant. Technically, the constant
will have a name, you just won't care about what it is, only that you
can use it.

=back

=head1 BUGS

Most software has bugs. This module probably isn't an exception.
If you find a bug please either email me, or add the bug to cpan-RT.

=head1 AUTHOR

Anders Nor Berle E<lt>debolaz@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Anders Nor Berle.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

