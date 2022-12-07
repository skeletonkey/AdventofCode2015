#!/usr/bin/perl

use Test::More;

require "wrapping_papper.pl";

my @tests = (
    [ [2, 3, 4],  58, 34 ],
    [ [1, 1, 10], 43, 14 ],
);
foreach my $test (@tests) {
    is(
        wrapping_papper::getSqFeet(@{$test->[0]}),
        $test->[1],
        "Wrapping Paper: " . join('x', @{$test->[0]})
    );
    is(
        wrapping_papper::getRibbonLength(@{$test->[0]}),
        $test->[2],
        "Ribbon: " . join('x', @{$test->[0]})
    );
}

done_testing();
