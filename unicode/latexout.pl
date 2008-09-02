#! /usr/bin/perl -T -w

=head1 NAME

latexout.pl - Filters the LaTeX log and output, so that UTF8 stays UTF8.

=head1 SYNOPSIS

latex I<arguments> | latexout.pl

=head1 DESCRIPTION

TeX replaces bytes in the range of 0x80 to 0x9F by ^^xx
sequences. This filter restores them.

=head1 BUGS

Only complete lines are parsed, so when TeX wants input, the prompt is
not displayed.

=head1 AUTHOR

Dominique Unruh <I<dominique@unruh.de>>.

=head1 SEE ALSO

The LaTeX package B<ucs.sty>.

=cut

$| = 1;

while (<>) {
    s/\^\^([0-9a-f]{2})/chr hex $1/egi;
    print $_;
}
