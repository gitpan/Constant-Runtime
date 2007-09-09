#!/usr/bin/env perl

use inc::Module::Install;

use strict;
use warnings;

name           'Constant-Runtime';
all_from       'lib/Constant/Runtime.pm';

build_requires 'Test::More' => '0.47';
build_requires 'Test::Pod' => '1.26';

auto_install;
WriteAll;

