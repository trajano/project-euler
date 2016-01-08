use strict;

my %square_to_roots;

for (1..999) {
    $square_to_roots{$_ * $_} = $_;
}

sub perimiter_if_integer_right_triangle_possible($$) {
    my $a = shift;
    my $b = shift;
    my $c = $square_to_roots{($a * $a) + ($b * $b)};
    return ($c && $c > $b && $c > $a) ? ($a+$b+$c) : 0;
}

my %counts;
OUTER: for my $a (1..999) {
    for my $b ($a..999) {
        my $p = perimiter_if_integer_right_triangle_possible($a, $b);
        if ($p == 1000) {
            print $a * $b * $square_to_roots{($a * $a) + ($b * $b)};
            last OUTER;
        }
        
    }
}
