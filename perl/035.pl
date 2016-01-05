#!/usr/bin/perl -wT 
use strict;
my @known_primes=(2,3,5,7,11,13);
my %known_prime_hash = map { $_ => 1 } @known_primes;
my $max_known_prime = 13;
my $n = 13;

sub add_if_prime2() {
    if (is_prime($n)) {
        $known_prime_hash{$n} = 1;
        $max_known_prime = $n;
    }
}

sub is_prime($) {
    my $x = shift;
    if (($x % 2) == 0 or ($x % 3) == 0) {
        return 0;
    }
    my $i = 5;
    while (($i * $i) <= $x) {
        return 0 if ($x % $i) == 0;
        return 0 if ($x % ($i + 2)) == 0;
        $i += 6;
    }
    return 1;
}

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

while ($max_known_prime < 1000000) {
    $n += 2;
    
    add_if_prime2();
}

foreach (keys %known_prime_hash) {
    has_all_rotations($_);
}

my $circular_prime_count = 0;
foreach (keys %known_prime_hash) {
    $circular_prime_count++ if $known_prime_hash{$_} == 2;
}

print $circular_prime_count;
