#!/usr/bin/perl -wT
use strict;
use lib '.';
use Euler;
my %known_prime_hash = map { $_ => 1 } @Euler::known_primes;

sub get_rotations($) {
    my $v = shift;
    my @ret = ($v);
    for (my $i = 0 ; $i < length($v) - 1; ++$i) {
       $v = substr($v, 1, length($v) - 1) . substr($v, 0, 1);
       push @ret, $v;
    }
    return @ret
}

sub has_all_rotations($) {
    my $prime = shift;
    return 1 if $known_prime_hash{$prime} == 2;
    my $has_all_rotations = 1;
    my @rotations = get_rotations($prime);
    foreach (@rotations) {
        $has_all_rotations &&= $known_prime_hash{$_};
        return 0 unless $has_all_rotations;
    }
    foreach (@rotations) {
        $known_prime_hash{$_} = 2;
    }
    return 1;

}

foreach (keys %known_prime_hash) {
    has_all_rotations($_);
}

my $circular_prime_count = 0;
foreach (keys %known_prime_hash) {
    $circular_prime_count++ if $known_prime_hash{$_} == 2;
}

print $circular_prime_count;
