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

sub is_pandigital($;$);
sub is_pandigital($;$) {
    my $v = shift;
    my $n = shift || length($v);

    return 1 if $n == 0 && length($v) == 0;
    return 0 unless $n == length($v);
    $v =~ s/$n// || return 0;
    return is_pandigital($v, $n - 1);
    
}

# Note: Nine numbers cannot be done (1+2+3+4+5+6+7+8+9=45 => always dividable by 3) 
# Note: Eight numbers cannot be done (1+2+3+4+5+6+7+8=36 => always dividable by 3)

for (my $i = 7654321; $i >= 2143; $i -= 2) {
	if (is_pandigital($i) && is_prime($i)) {
		print $i;
		last;
	}
}