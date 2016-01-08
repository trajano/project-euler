#!/usr/bin/perl -w
use strict;
use List::Util qw(sum);

sub is_unusual($$) {
    my $x = shift;
    my $y = shift;
    return is_pandigital(($x * $y) . $x . $y, 9);

}

sub is_pandigital($;$);
sub is_pandigital($;$) {
    my $v = shift;
    my $n = shift || length($v);

    return 1 if $n == 0 && length($v) == 0;
    return 0 unless $n == length($v);
    $v =~ s/$n// || return 0;
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
