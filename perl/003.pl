#!/usr/bin/perl
use List::Util qw( max );

sub prime_factors($) {
    my $n = shift;
    my @factors = ();
    $d = 2;
    while ($n > 1) {
        while ($n % $d == 0) {
            push @factors, $d;
            $n /= $d;
        }
        ++$d;
    }
    return @factors;
}

print max(prime_factors(600851475143));
