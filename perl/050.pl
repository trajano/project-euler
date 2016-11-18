#!/usr/bin/perl -wT
use strict;
use lib '.';
use Euler;

sub prime_below($) {
    my $v = shift;
    for (reverse(@Euler::known_primes)) {
        return $_ if $v > $_;
    }
}

sub prime_below_pos($) {
    my $v = shift;
    for (my $i = $#Euler::known_primes; $i >= 0; --$i) {
        return $i if $v > $Euler::known_primes[$i];
    }
}

sub longest_sum_of_consecutive_primes_internal($$$);
sub longest_sum_of_consecutive_primes_internal($$$) {
    my $p = shift;
    my $pi = shift;
    my $start = shift;
    my $best_sum = 0;
    my $best_len = 0;

    if ($start == $pi) {
        return (0, -1);
    }
    my $sum = 0;
    for (my $i = $start; $i < $pi; ++$i) {
        $sum += $Euler::known_primes[$i];
        last if ($sum > $p);
        if (Euler::is_prime($sum)) {
            $best_sum = $sum;
            $best_len = $i - $start;
        }
    }
    my ($rec_sum, $rec_len) = longest_sum_of_consecutive_primes_internal($p, $pi, $start + 1);
    if ($rec_len > $best_len) {
        return ($rec_sum, $rec_len);
    } else {
        return ($best_sum, $best_len);
    }
}
sub longest_sum_of_consecutive_primes($) {
    my $v = shift;
    my $p = prime_below($v);
    my $pi = prime_below_pos($v);
    my ($best_sum, $best_len) = longest_sum_of_consecutive_primes_internal($p, $pi, 0);
    return $best_sum;
}

print longest_sum_of_consecutive_primes(1000000);
