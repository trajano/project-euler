#!/usr/bin/perl

my @known_primes=(2,3,5,7,11,13);
my %known_primes_hash = map { $_ => 1 } @known_primes;
my $max_known_prime = 13;
my $n = 13;

sub add_if_prime2() {
    if (is_prime($n)) {
        push @known_primes, $n;
        $known_primes_hash{$n} = 1;
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

while (0 + @known_primes < 10001) {
    $n += 2;
    
    add_if_prime2();
}
print $max_known_prime;
