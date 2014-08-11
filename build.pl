#!/usr/bin/env perl

use strict;
use warnings;

my $content = `slimrb -p slides.slim`;
print $!;

open FH, '<boilerplate.html' or die "Can't open boilerplate: $!";
undef $/;
my $template = <FH>;
close FH;

$template =~ s/{{slides}}/$content/;

open FH, '>index.html' or die "Can't open index: $!";
print FH $template;
close FH;
