#!/usr/bin/perl

use strict;
use warnings;

my %translate = ( '(' => 1, ')' => -1 );

open(my $fh, '<', 'data') || die("Unable to open data file for read: $!\n");
my $data = <$fh>;
close($fh);

my $part1 = 0;
my $part2 = 1;
my $found_part2 = 0;
foreach (split(//, $data)) {
    $part1 += $translate{$_};
    if (!$found_part2) {
        if ($part1 eq -1) {
            $found_part2 = 1;
        }
        else {
            $part2++;
        }
    }
}

print "Santa ends up on floor #$part1\n";
print "Position #$part2 put Santa into the basement\n"