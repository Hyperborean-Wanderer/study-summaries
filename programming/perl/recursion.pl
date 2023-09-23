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
    CORE::say "Moving disk #$disk from $start to $end.";
}

@position = ('', ('A') x 4); # Initial position of disks, update accordingly num of disks
#CORE::say "@position";

sub check_move{
    my ($disk, $start, $end) = @_;
    my $i;

    if($disk < 1 || $disk > $#position){ # Such a disk nmber shouldn't exist
        die "Bad disk number $disk. Should be 1..$#position.\n";
    }

    unless($position[$disk] eq $start){ # Disk should be on the desired start position
        die "Tried to move disk $disk from $start, but it is on peg $position[$disk].\n";
    }

    for $i (1 .. $disk - 1){
        if($position[$i] eq $start){ # Smaller disks shouldn't be on top of the target disk
            die "Can't move disk $disk from $start because $i is on top of it.\n";
        } elsif($position[$i] eq $end){ # Nor be already on the target peg
            die "Can't move disk $disk to $end because $i is already there.\n";
        }
    }

    print_movement($disk, $start, $end);
    $position[$disk] = $end;
    #CORE::say "@position";
}

#CORE::say binary(37);
#CORE::say factorial(4);
hanoi(4, 'A', 'C', 'B', \&check_move);

