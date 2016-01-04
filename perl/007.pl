#!/usr/bin/perl

my @known_primes=(2,3,5,7,11,13);
my %known_primes_hash = map { $_ => 1 } @known_primes;
my $max_known_prime = 13;
my $n = 13;

sub add_if_prime() {
    foreach my $prime (keys %known_primes_hash) {
        if ($n % $prime == 0) {
            return false;
        }
    }
    push @known_primes, $n;
    $known_primes_hash{$n} = 1;
    $max_known_prime = $n;
    return true;
}
while (0 + @known_primes < 10001) {
    $n += 2;
    
    add_if_prime();
}
print $max_known_prime;
