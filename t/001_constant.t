#!/usr/bin/env perl

use Test::More tests => 4;

use strict;
use warnings;

BEGIN { use_ok ("Constant::Runtime") }

Constant::Runtime->make ("Foo",42);

is (Foo(),42);

Constant::Runtime->make ("Foo::Bar",42);

is (Foo::Bar(),42);

my $constant = Constant::Runtime->make_anon (42);

is (eval "$constant",42);

