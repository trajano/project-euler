#!/usr/bin/perl -w
use strict;

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

sub is_pandigital($) {
    my $v = shift;
    my $n = length($v);

    return 0 unless $v !~ /9/ || $v =~ /^[^9]*9[^9]*$/;
    return 0 unless $v !~ /8/ || $v =~ /^[^8]*8[^8]*$/;
    return 0 unless $v !~ /7/ || $v =~ /^[^7]*7[^7]*$/;
    return 0 unless $v !~ /6/ || $v =~ /^[^6]*6[^6]*$/;
    return 0 unless $v !~ /5/ || $v =~ /^[^5]*5[^5]*$/;
    return 0 unless $v !~ /4/ || $v =~ /^[^4]*4[^4]*$/;
    return 0 unless $v !~ /3/ || $v =~ /^[^3]*3[^3]*$/;
    return 0 unless $v !~ /2/ || $v =~ /^[^2]*2[^2]*$/;
    return 0 unless $v !~ /1/ || $v =~ /^[^1]*1[^1]*$/;
    return 0 if $v =~ /0/;

	return 0 if $v =~ /5/ && $n < 5;
	return 0 if $v =~ /6/ && $n < 6;
	return 0 if $v =~ /7/ && $n < 7;
	return 0 if $v =~ /8/ && $n < 8;
	return 0 if $v =~ /9/ && $n < 9;

    return 1;
    
}

for (my $i = 2141; $i <= 987654321; $i += 2) {
	if (is_prime($i) && is_pandigital($i)) {
		print "$i\n";
	}
}
#for (my $i = 987654321; $i >= 100000000; $i -= 2) {
#	if (is_prime($i)) {
#		print "$i\n";
#	if (is_pandigital($i)) {
#		last;	
#	}
#	}
#}
