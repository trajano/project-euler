use strict;

my %square_to_roots;

for (1..999) {
    $square_to_roots{$_ * $_} = $_;
}

sub perimiter_if_integer_right_triangle_possible($$) {
    my $a = shift;
    my $b = shift;
    return 0 if $a > $b;
    my $c = $square_to_roots{($a * $a) + ($b * $b)};
    return ($c && $c > $b && $c > $a) ? ($a+$b+$c) : 0;
}

my %counts;
for my $a (1..999) {
    for my $b (1..999) {
        my $p = perimiter_if_integer_right_triangle_possible($a, $b);
        ++$counts{$p} if ($p && $p < 1000);
    }
}

my $max = $counts{120};
my $max_key;
for (keys %counts) {
    if ($counts{$_} > $max) {
        $max = $counts{$_};
        $max_key = $_;
    }
    
}
print $max_key;
