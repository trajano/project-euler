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

    return 0 unless $v !~ /7/ || $v =~ /^[^7]*7[^7]*$/;
    return 0 unless $v !~ /6/ || $v =~ /^[^6]*6[^6]*$/;
    return 0 unless $v !~ /5/ || $v =~ /^[^5]*5[^5]*$/;
    return 0 unless $v !~ /4/ || $v =~ /^[^4]*4[^4]*$/;
    return 0 unless $v !~ /3/ || $v =~ /^[^3]*3[^3]*$/;
    return 0 unless $v !~ /2/ || $v =~ /^[^2]*2[^2]*$/;
    return 0 unless $v !~ /1/ || $v =~ /^[^1]*1[^1]*$/;
    return 0 if $v =~ /[089]/;

	return 0 if $v =~ /5/ && $n < 5;
	return 0 if $v =~ /6/ && $n < 6;
	return 0 if $v =~ /7/ && $n < 7;

    return 1;
    
}

# Note: Nine numbers cannot be done (1+2+3+4+5+6+7+8+9=45 => always dividable by 3) 
# Note: Eight numbers cannot be done (1+2+3+4+5+6+7+8=36 => always dividable by 3)

for (my $i = 7654321; $i >= 2143; $i -= 2) {
	if (is_prime($i) && is_pandigital($i)) {
		print $i;
		last;
	}
}