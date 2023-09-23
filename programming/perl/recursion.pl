sub binary{
    my ($n) = @_;

    return $n if $n == 0 || $n == 1;

    my $k = int($n / 2);
    my $b = $n % 2;

    my $E = binary($k);

    return $E . $b;
}

sub factorial{
    my ($n) = @_;

    return 1 if $n == 0;
    return factorial($n - 1) * $n;
}

sub hanoi{
    my ($n, $start, $end, $extra) = @_;

    if($n == 1) {
        CORE::say "Move disk #1 from $start to $end.";
    } else {
        hanoi($n - 1, $start, $extra, $end);
        CORE::say "Move disk #$n from $start to $end.";
        hanoi($n - 1, $extra, $end, $start);
    }
}

CORE::say binary(37);
CORE::say factorial(4);
hanoi(3, 'A', 'C', 'B');
