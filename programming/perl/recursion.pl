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
    my ($n, $start, $end, $extra, $update_output) = @_;

    if($n == 1) {
        $update_output->(1, $start, $end);
    } else {
        hanoi($n - 1, $start, $extra, $end, $update_output);
        $update_output->($n, $start, $end);
        hanoi($n - 1, $extra, $end, $start, $update_output);
    }
}

sub print_movement{
    my ($disk, $start, $end) = @_;
    CORE::say "Move disk #$disk from $start to $end.";
}

CORE::say binary(37);
CORE::say factorial(4);
hanoi(3, 'A', 'C', 'B', \&print_movement);
