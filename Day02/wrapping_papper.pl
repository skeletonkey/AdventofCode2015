package wrapping_papper;

open(my $fh, '<', 'data') || die("Unable to open data file for read: $!\n");
my @data = <$fh>;
close($fh);

my $total = 0;
my $totalRibbon = 0;
foreach my $data (@data) {
    my @parts = split(/x/, $data);
    $total += getSqFeet(@parts);
    $totalRibbon += getRibbonLength(@parts);
}

print "Total: $total\n";
print "Total Ribbon: $totalRibbon\n";

sub getRibbonLength {
    my ($l, $w, $h) = @_;

    my ($d1, $d2) = sort { $a <=> $b } ($l, $w, $h);

    return 2 * $d1 + 2 * $d2 + $l * $w * $h;
}

sub getSqFeet {
    my ($l, $w, $h) = @_;

    my $lw = $l * $w;
    my $min = $lw;
    my $wh = $w * $h;
    $min = $wh if $wh < $min;
    my $hl = $h * $l;
    $min = $hl if $hl < $min;

    return 2 * $lw + 2 * $wh + 2 * $hl + $min;
}
1;