#!/usr/bin/perl -w
use strict;
use List::Util qw(sum);

sub is_unusual($$) {
    my $x = shift;
    my $y = shift;
    # This are the only possible sequence, sorter X or Y will not yield a anything larger than a 4 digit result, but we need 9 digits.
    # XX x YYY = ZZZZ
    # XXX x YYY = ZZZZ

    #print substr($x, 0, 2) . " x " . substr($x, 2, 3) . "==" . substr($x, 5, 4) . "\n";
    return is_pandigital(($x * $y) . $x . $y, 9);

}

sub is_pandigital($$);
sub is_pandigital($$) {
    my $v = shift;
    my $n = shift;

    return 1 if $n == 0 && length($v) == 0;
    return 0 unless $n == length($v);
    $v =~ s/$n//;
    return is_pandigital($v, $n - 1);
    
}

my %unusuals;
for my $x (1..99) {
    for my $y (1..9999) {
        next if $x * $y >= 10000000000;
        if (is_unusual($x, $y)) {
            $unusuals{$x*$y} = 1;
        }
    }
}

print sum(keys %unusuals);
