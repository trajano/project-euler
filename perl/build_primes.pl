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

while ($max_known_prime < 1000000) {
    $n += 2;

    add_if_prime2();
}

my $known_primes =  join ",\n", sort { $a <=> $b } keys %known_prime_hash;
open(P,">Euler.pm") || die $!;
print P <<EOT;
package Euler;
use strict;
use warnings;
use Exporter qw(import);
our \@EXPORT_OK = qw(is_prime known_primes);

sub is_prime(\$) {
    my \$x = shift;
    if ((\$x % 2) == 0 or (\$x % 3) == 0) {
        return 0;
    }
    my \$i = 5;
    while ((\$i * \$i) <= \$x) {
        return 0 if (\$x % \$i) == 0;
        return 0 if (\$x % (\$i + 2)) == 0;
        \$i += 6;
    }
    return 1;
}

our \@known_primes = ($known_primes);
EOT
close(P);
