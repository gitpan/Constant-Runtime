#!/usr/bin/env perl

use Test::More;

use strict;
use warnings;

eval "use Test::Pod";

plan skip_all => "Test::Pod required for testing POD" if $@;

all_pod_files_ok();

