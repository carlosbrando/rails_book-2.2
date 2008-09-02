#!/usr/bin/perl -T

# The content of the following variable is configuration data:
@DiscoverMacro::datafile_path = ('program','.');

=head1 NAME

discovermacro.pl - Discover which LaTeX package contains a missing macro

=head1 SYNOPSIS

B<discovermacro.pl> \I<themissingmacro>

B<discovermacro.pl> I<mydocument.log>

B<discovermacro.pl>

=head1 DESCRIPTION

The ucs package uses many macros from many packages which have to be 
included with B<\usepackage> before the inclusion of F<ucs.sty>.

The missing macro can be given directly as parameter. Note that the
backslash must be included, so with most shells you either need to
quote it or write a double backslash (e. g. \\cyrc or '\cyrc').

An alternative way is to give a LaTeX log file as parameter in which
case the missing macros are parsed from it. 

If no argument is given, the newest LaTeX log file in the current
directory is used as default.

=head1 ALTERNATIVES

B<discovermacro.pl> uses the data file F<ltxmacrs.txt> which is human
readable, thus can be used directly.

F<http://www.unruh.de/DniQ/cgi/discovermacro.cgi> provides an online
version of this script.

=cut

use strict;

package DiscoverMacro::H;

sub cleanline($) {
    my $line = shift;
    chomp $line;
    $line =~ s/^\s*//;
    $line =~ s/^\#.*//;
    return $line;
}


sub readline2($) {
    my $file = shift;
    my $line = <$file>;
    while ($line =~ /\\\n?$/s) {
	$line =~ s/\\\n?$//;
	my $next = <$file>;
	$next =~ s/^\s*//;
	$line .= $next;
    }
    return $line;
}

sub escape($$) {
    my ($format,$text) = @_;
    if ($format eq 'text/plain') {
	$text =~ s/\[\[\[.*?\]\]\]//g;
    } elsif ($format eq 'text/html') {
	$text =~ s{[<>&]|(\n[ \t]*)}{ my $x=$&;
	    if ($x =~ /^\n/) {
		$x=~s/\t/        /g;
		$x=~s/ /&nbsp;/g;
		"<br>$x"; 
	    } else {
		sprintf "&#%d;", ord $& }}egs;
	$text =~ s{\[\[\[.+?\]\]\]}{
	    my ($t) = ($& =~ /\[\[\[(.+?)\]\]\]/);
	    my @t = split / /,$t;
	    my $r = '';
	    if ($t[0] eq 'NAME') {
		$r = "<a name=\"$t[1]\">";
	    } elsif ($t[0] eq 'HREF') {
		$r = "<a href=\"$t[1]\">";
	    } elsif ($t[0] eq '/NAME') {
		$r = "</a>";
	    } elsif ($t[0] eq '/HREF') {
		$r = "</a>";
	    } else {
		warn "escape($format,[[[$t[0]...]]])";
	    }
	}ge;
	return $text;
    } elsif ($format eq 'identifier') {
	$text =~ s/[^a-z0-9]/
	    sprintf "_%02X", ord $&/ge;
    } else {
	warn "Unknown format $format";
	return escape('text/plain',$text);
    }
    return $text;
}

sub header($$) {
    my ($format,$header) = @_;
    $header = escape($format,$header);
    if ($format eq 'text/plain') {
	my $len = length $header;
	return "\n$header\n".('=' x $len)."\n";
    } elsif ($format eq 'text/html') {
	return "<p><table border=1>\n<tr><th align=left colspan=2>$header</th></tr>\n";
    } else {
	warn "Unknown format $format";
	return header('text/plain',$header);
    }
}

sub footer($) {
    my ($format) = @_;
    if ($format eq 'text/plain') {
	return "\n";
    } elsif ($format eq 'text/html') {
	return "</table></p>\n\n";
    } else {
	warn "Unknown format $format";
	return footer('text/plain');
    }
}

sub line($$) {
    my ($format,$line) = @_;
    $line = escape $format, $line;
    if ($format eq 'text/plain') {
	return "$line\n";
    } elsif ($format eq 'text/html') {
	return "<tr><td colspan=2>$line</td></tr>\n";
    } else {
	warn "Unknown format $format";
	return line($format,$line);
    }
}


sub twocol($$$) {
    my ($format,$col1,$col2) = @_;
    $col1 = escape $format, $col1;
    $col2 = escape $format, $col2;
    if ($format eq 'text/plain') {
	return "$col1\t$col2\n";
    } elsif ($format eq 'text/html') {
	return "<tr><td>$col1&nbsp;&nbsp;&nbsp;</td><td>$col2</td></tr>\n";
    } else {
	warn "Unknown format $format";
	return twocol('text/plain',$col1,$col2);
    }
}


package DiscoverMacro::Feature;

use vars qw/$obj_count/;
$obj_count = 0;

sub new($$$) {
    my ($proto,$db,$name) = @_;
    $obj_count++;
    my $class = ref($proto) || $proto;
    my $self = {};
    bless $self, $class;
    $self->{name} = $name;
    $self->{db} = $db;
    $self->loadfeature();
    return $self;
}

sub DESTROY {
    $obj_count--;
}

sub getfontenc($) {
    my $self = shift;
    return $self->{fontencoding};
}

sub getlatexcmd($) {
    $_[0]->{latexcmd};
}

sub getneeds($) {
    my $self = shift;
    return $self->{needs};
}

sub getpackages($) {
    my $self = shift;
    return $self->{packages};
}

sub getpackages_ascode($) {
    my $self = shift;
    return join '', map {
	my $p = $_;
	$p = "{$_}" unless $p =~ /\}$/;
	"\\usepackage$p\n";
    } @{$self->{packages}};
}


sub loadfeature($) {
    my $self = shift;
    my $pos = $self->{db}->getfeaturepos($self->{name});
    unless (defined $pos) {
	$self->{undefined} = 1;
	return;
    }
    my $file = $self->{db}->getfileat($pos);
    my $line;
    my $lastfile = undef;
    while (defined ($line = DiscoverMacro::H::readline2($file))) {
	my $tlastfile;
	$line = DiscoverMacro::H::cleanline $line;
	next if $line eq '';
	my @line = split ' ',$line;
	if ($line[0] eq 'FONTENCODING') {
	    warn "Two fontencodings in feature $self->{name}"
		if defined $self->{fontencoding};
	    $self->{fontencoding} = $line[1];
	} elsif ($line[0] eq 'CTAN') {
	    if (!defined $lastfile) {
		die "CTAN not preceded by FILE in feature $self->{name}"; }
	    my $ctan = $self->{ctan};
	    warn "Two CTAN locations defined for file $lastfile ".
		"in feature $self->{name}" if defined $$ctan{$lastfile};
	    $$ctan{$lastfile} = $line[1];
	    $self->{ctan} = $ctan;
	} elsif ($line[0] eq 'LATEXCMD') {
	    warn "Two LATEXCMDs in feature $self->{name}"
		if defined $self->{latexcmd};
	    $self->{latexcmd} = $line[1];
	} elsif ($line[0] eq 'NEEDS') {
	    warn "Two NEEDS lines in feature $self->{name}"
		if defined $self->{needs};
	    $self->{needs} = join ' ',@line[1..$#line];
	} elsif ($line[0] eq 'END') {
	    warn "FEATURE $self->{name} ended by END $line[1]"
		if $line[1] ne 'FEATURE';
	    last;
	} elsif ($line[0] eq 'COMMENT') {
	    my $comment = readblock($file,'COMMENT',1);
	    if (defined $self->{comment}) {
		warn "Two COMMENT sections in feature $self->{name}.".
		    "Concatenating";
		$comment = "$self->{comment}$comment"; }
	    $self->{comment} = $comment;
	} elsif ($line[0] eq 'INSTALL') {
	    my $install = readblock($file,'INSTALL',1);
	    if (defined $self->{install}) {
		warn "Two INSTALL sections in feature $self->{name}.".
		    "Concatenating";
		$install = "$self->{install}$install"; }
	    $self->{install} = $install;
	} elsif ($line[0] eq 'FILE') {
	    push @{$self->{files}}, $line[1];
	    $tlastfile = $line[1];
	} elsif ($line[0] eq 'PACKAGE') {
	    push @{$self->{packages}}, $line[1];
	} else {
	    warn "Unknown command in feature $self->{name}: $line[0]";
	}
	$lastfile = $tlastfile; $tlastfile = undef;
    }
}

sub readblock($$$) {
    my ($file,$blocktype,$raw) = @_;
    my $line;
    my $str = '';
    while (defined ($line = $raw?<$file>:DiscoverMacro::H::readline2($file))) {
	return $str if ($line =~ /^\s*END\s+\Q$blocktype\E\s*$/);
	$line = DiscoverMacro::H::cleanline $line unless $raw;
	#print "L:$line\n";
	$str .= $line;
    }
    warn "EOF in $blocktype";
    return $str;
}

sub isdefined($) {
    my $self = shift;
    return !$self->{undefined};
}

sub as_text($$) {
    my ($self,$f) = @_;
    my $link = "[[[NAME ".
	DiscoverMacro::H::escape('identifier',$self->{name})."]]]";
    my $text = DiscoverMacro::H::header
	($f,"${link}Feature: $self->{name}\[[[/NAME]]]");
    if ($self->{undefined}) {
	$text .= DiscoverMacro::H::line($f,"No information available");
    }
    if (defined $self->{fontencoding}) {
	$text .= DiscoverMacro::H::twocol($f,"Fontencoding:",
					  $self->{fontencoding});
    }
    for my $i (@{$self->{packages}}) {
	$text .= DiscoverMacro::H::twocol($f,"Package:",$i);
    }
    if (defined $self->{needs}) {
	$text .= DiscoverMacro::H::twocol($f,"Needs:",$self->{needs});
    }
    for my $i (@{$self->{files}}) {
	my $ctan = ${$self->{ctan}}{$i};
	if (defined $ctan) {
	    $ctan = " (CTAN: [[[HREF http://www.ctan.org/tex-archive/".
		"$ctan]]]$ctan\[[[/HREF]]])";
	} else { $ctan = ''; };
	$text .= DiscoverMacro::H::twocol($f,"Needed file:",$i.$ctan);
    }
    if ($self->{comment}) {
	$text .= DiscoverMacro::H::twocol($f,"Comment:",$self->{comment});
    }
    if ($self->{install}) {
	$text .= DiscoverMacro::H::twocol($f,"Installation:",$self->{install});
    }
    $text .= DiscoverMacro::H::footer $f;
    return $text;
}

package DiscoverMacro::Macro;

use Data::Dumper;

use vars qw/$obj_count/;
$obj_count = 0;

sub new($$$) {
    my ($proto,$db,$macro) = @_;
    my $class = ref($proto) || $proto;
    my $self = {};
    $obj_count++;
    bless $self, $class;
    $self->{macro} = $macro;
    $self->{db} = $db;
    $self->loadlist();
    return $self;
}

sub DESTROY {
    $obj_count--;
}

sub isdefined($) {
    my $self = shift;
    return !$self->{undefined};
}

sub getname($) {
    my $self = shift;
    return $self->{macro};
}

sub getlist($) {
    my $self = shift;
    return $self->{list};
}

sub loadlist($) {
    my $self = shift;
    my $macros = $self->{db}->{macros};
    my $macro = $self->{macro};
    my $list = $$macros{$macro};
    unless (defined $list) {
	my $regex = $self->{db}->{regexmacros};
	while (my ($re,$l) = each %$regex) {
	    #print "RE: $re\n";
	    if ($macro =~ /$re/) {
		$self->{regex} = $re;
		$list = $l; last; }
	}
    }
    unless (defined $list) {
	$self->{undefined} = 1;
	return;
    }
    $self->{list} = $list;
    my %tlist;
    my @list = grep { my $bad = $_ eq 'OR' || $_ eq 'AND' || $tlist{$_};
		  $tlist{$_}=1; !$bad; } split ' ', $self->{list};
    my %features = ();
    for my $i (@list) {
	$features{$i} = new DiscoverMacro::Feature($self->{db},$i)
	    unless defined $features{$i};
    }
    $self->{features} = \%features;
}

sub getfeature($) {
    my ($self,$name) = @_;
    return ${$self->{features}}{$name};
}

sub as_text($$) {
    my ($self,$f) = @_;
    my $text = '';
    my $link = "[[[NAME ".
	DiscoverMacro::H::escape('identifier',$self->{macro})."]]]";
    $text .= DiscoverMacro::H::header
	($f,"${link}Macro: $self->{macro}\[[[/NAME]]]");
    if ($self->{undefined}) {
	$text .= DiscoverMacro::H::line($f,"Macro is unknown.");
    } else {
	my $list = $self->{list};
	my $features = $self->{features};
	$list =~ s{\S+}{
	    my $w = $&;
	    if ($$features{$w}) {
		$w = "[[[HREF #".DiscoverMacro::H::escape('identifier',$w).
		    "]]]$w\[[[/HREF]]]";
	    }
	    $w;
	}ge;
	$text .= DiscoverMacro::H::twocol($f,"Available with:",$list);
    }
    $text .= DiscoverMacro::H::footer($f);
    for my $feature (values %{$self->{features}}) {
	$text .= $feature->as_text($f);
    }
    return $text;
}

package DiscoverMacro;

use IO::File;
use Data::Dumper;

use vars qw/$obj_count @datafile_path/;
$obj_count = 0;

sub new($) {
    my ($proto) = @_;
    my $class = ref($proto) || $proto;
    my $self = {};
    $obj_count++;
    bless $self, $class;
    $self->{missingmacros} = {};
    $self->opendata();
    return $self;
}

sub DESTROY {
    $obj_count--;
}

sub skip_to_end($$$) {
    my ($file,$type,$lnr) = @_;
    my $line;
    while (defined ($line = DiscoverMacro::H::readline2($file))) {
	return $file->getpos 
	    if $line =~ /^\s*END\s*\Q$type\E\s*$/;
    }
    warn "Could not find end of $type-section started on line $lnr";
    return undef;
}

sub lineinfo($) {
    my $lnr = shift;
    return "ltxmacrs.txt:$lnr: ";
}

sub opendata($) {
    my $self = shift;
    my $macros = {};
    my $regexmacros = {};
    my $features = {};
    my $datafile = $self->{datafile};
    unless (defined $datafile) {
	for my $dir (@datafile_path) {
	    if ($dir eq 'program') {
		$datafile = $0; $datafile =~ s@[^/]*$@ltxmacrs.txt@;
	    } elsif (-d $dir) {
		$datafile = "$dir/ltxmacrs.txt";
	    } else {
		$datafile = "$dir";
	    }
	    if (-e $datafile) { last; }
	    else { $datafile = undef; }
	}
	die "Could not find data file ltxmacrs.txt in path ".
	    join ', ', map {
		($_ eq 'program')?'script location':$_ } @datafile_path
		    unless defined $datafile;
	$self->{datafile} = $datafile;
    }
    my $data = new IO::File($datafile,"r") or
	die "Could not open $datafile for reading";
    my $line;
    while (defined ($line = DiscoverMacro::H::readline2($data))) {
	$line = DiscoverMacro::H::cleanline($line);
	next if $line eq '';
	my (@line) = split ' ', $line;
	if ($line[0] eq 'MACRO') {
#	    print Dumper(\@line);
	    warn lineinfo($.)."Macro $line[1] given twice\n"
		if defined $$macros{$line[1]};
	    $$macros{$line[1]} = join ' ', @line[2..$#line];
	} elsif ($line[0] eq 'REGEX') {
	    warn lineinfo($.)."Regex macro $line[1] given twice\n"
		if defined $$regexmacros{$line[1]};
	    $$regexmacros{$line[1]} = join ' ', @line[2..$#line];
	} elsif ($line[0] eq 'FEATURE') {
	    $$features{$line[1]} = $data->getpos;
	    skip_to_end($data,'FEATURE',$.);
	} else {
	    warn lineinfo($.)."Unknown command '$line[0]'\n";
	}
    }
    $self->{macros} = $macros;
    $self->{regexmacros} = $regexmacros;
    $self->{features} = $features;
    $self->{datafile} = $data;

#    print Dumper($macros);
}

sub getmacro($$) {
    my ($self,$macro) = @_;
    return new DiscoverMacro::Macro($self,$macro);
}

sub getfeaturepos($$) {
    my ($self,$feature) = @_;
    my $features = $self->{features};
    return $$features{$feature};
}

sub readlog($$;$) {
    my ($self,$filename,$file) = @_;
    my $found = 0;
    if (!defined $file) {
	$file = new IO::File($filename,"r")
	    or die "Could not open log file '$filename' for reading: $!";
    }
    my $line;
    while (defined ($line = <$file>)) {
	chomp $line;
	if ($line =~ /^! Undefined control sequence\.$/) {
	    chomp ($line = <$file>);
	    #print "LINE: '$line'\n";
	    my $dots = '';
	    my ($macro) = ($line =~ /(\\.)$/);
	    ($dots,$macro) = 
		($line =~ /(...)(\\[a-zA-Z@]+) ?$/) unless defined $macro;
	    ($dots,$macro) = 
		($line =~ /(...)([a-zA-Z@]+) ?$/) unless defined $macro;
	    my $regex = 0;
	    if ($dots eq '...') {
		$regex = 1;
		$macro =~ s/^\\//;
		$macro = "\\\\[a-zA-Z@]*\Q$macro";
	    } else {
		$macro = "\\$macro" unless $macro =~ /^\\/;
	    }
	    unless (defined $macro) {
		warn "$filename:$.: Could not identify undefined control in:\n".
		    "\t$line\n";
		next; };
	    #print "MACRO: '$macro'\n";
	    if ($regex) {
		$found = 0;
		for my $m (keys %{$self->{macros}}) {
		    if ($m =~ /$macro/) {
			$self->addmacro($m);
			$found = 1; }
		}
		$self->addmacro("REGEX:$macro") unless $found;
	    } else {
		$self->addmacro($macro);
	    }
	    $found = 1;
	} elsif ($line =~ /^! Package babel Error: You haven\'t defined the language (.+) yet.$/) {
	    my $lang = $1;
	    $self->addmacro("\\selectlanguage{$lang}");
	    $found = 1;
	} elsif ($line =~ /^! LaTeX Error: Environment .* undefined\.$/) {
	    my ($env) =
		($line =~ /^! LaTeX Error: Environment (.*) undefined\.$/);
	    unless (defined $env) {
		warn "$filename:$.: Could not identify environment in:\n".
		    "\t$line\n" unless defined $env;
		next; };
	    $self->addmacro("\\begin{$env}");
	    $found = 1;
	} elsif ($line =~ /^! LaTeX Error: Encoding scheme \`.*\' unknown\.$/) {
	    my ($fe) =
		($line =~ /^! LaTeX Error: Encoding scheme \`(.*)\' unknown\.$/);
	    unless (defined $fe) {
		warn "$filename:$.: Could not identify fontencoding in:\n".
		    "\t$line\n" unless defined $fe;
		next; };
	    $self->addmacro("\\fontencoding{$fe}");
	    $found = 1;
	} elsif ($line =~ /^! LaTeX Error: Command .* (not provided|unavailable)/) {
	    my ($macro) =
		($line =~ /^! LaTeX Error: Command (.*) (not provided|unavailable)/);
	    unless (defined $macro) {
		warn "$filename:$.: Could not identify macro in:\n".
		    "\t$line\n" unless defined $macro;
		next; };
	    $macro = "\\$macro" unless $macro =~ /^\\/;
	    $self->addmacro("$macro");
	    $found = 1;
	} elsif ($line =~ /^! Package ucs Error: Unknown .* tag '.*' \((.*)\)\.$/) {
	    my ($macro) =
		($line =~ /^! Package ucs Error: Unknown .* tag '.*' \((.*)\)\.$/);
	    unless (defined $macro) {
		warn "$filename:$.: Could not identify macro in:\n".
		    "\t$line\n";
		next; };
	    $macro = "\\$macro" unless $macro =~ /^\\/;
	    $self->addmacro("$macro");
	    $found = 1;
	} elsif ($line =~ /^! Font .*=([^=]+) at .* not loadable: Metric \(TFM\)/) {
	    my ($tfm) = ($line =~ /^! Font .*=([^=]+) at .* not loadable: Metric \(TFM\)/);
	    unless (defined $tfm) {
		warn "$filename:$.: Could not identify TFM filename in:\n".
		    "\t$line\n";
		next; };
	    print "XXX: $tfm\n";
	    $self->addmacro("$tfm.tfm");
	    $found = 1;
	}
    }
    close $file;
    return $found;
}

sub addmacro($$%) {
    my ($self,$macro) = @_;
    my $macros = $self->{missingmacros};
    return $$macros{$macro} if $$macros{$macro};
    my $res = $self->getmacro($macro);
    $$macros{$macro} = $res if defined $res;
    return $res;
}

sub getfileat($$) {
    my ($self,$pos) = @_;
    my $file = $self->{datafile};
    $file->setpos($pos) or
	die "Could not seek in datafile to pos $pos";
    return $file;
}

sub getmissingmacros($) {
    my $self = shift;
    return $self->{missingmacros};
}

sub as_text($$) {
    my ($self,$f) = @_;
    my $macros = $self->{missingmacros};
    my $str = '';
    for my $m (keys %$macros) {
	$str .= $$macros{$m}->as_text($f);
    }
    return $str;
}

sub close($) {
    my $self = shift;
    $self->{macros} = undef;
    $self->{features} = undef;
    $self->{missingmacros} = undef;
    close $self->{datafile};
}

sub getfeature($$) {
    my ($self,$feature) = @_;
    return new DiscoverMacro::Feature($self,$feature);
}

sub scanformacro($%) {
    my ($self,%args) = @_;
    my $file = $args{file};
    my $fh = new IO::File($file,"r") or
	die "Could not open $file for reading: $!";
    my $line;
    # {\newenvironment}{\renewenvironment}{\newif}
    my $newcommand = '\\\\newcommand|\\\\renewcommand|\\\\providecommand|'.
	'\\\\DeclareRobustCommand|\\\\def';
    my $newenvironment = '\\\\newenvironment|\\\\renewenvironment';
    my @macros;
    while (defined ($line = <$fh>)) {
	chomp $line;
	print "L: $line\n";
	$line =~ s{($newcommand) \s* \{? (\\[a-zA-Z@]+) \}?}{
	    print "MACRO: $2\n";
	    my ($env) = ($2 =~ /^\\end(.*)$/);
	    if (defined $env) {
		print "ENV: $env\n"; }
	}gxeo;
	$line =~ s{($newenvironment) \s* \{ ([^\}]+) \} }{
	    print "ENV: $2\n";
	}gxeo;
    }
    print Dumper [\@macros];
}


sub main(@) {
    if (@_) {
	for my $file (@_) {
	    my $obj = new DiscoverMacro;
	    if (-e $file) {
		$obj->readlog($file);
	    } else {
		$obj->addmacro($file);
	    }
	    print $obj->as_text('text/plain');
	};
    } else {
	my ($file) = 
	    sort { my @a = stat $a; my @b = stat $b; $b[9] <=> $a[9] }
	grep { $_ ne 'missfont.log' } (<*.log>);
	die "No logfile found" if (!defined $file);
	print "Using logfile $file.\n";
	&main($file);
    }
}

sub test() {
    my $obj = new DiscoverMacro;
    $obj->scanformacro(file => 'test.tex');
    exit;
}

#test;

caller || &main(@ARGV);

1;
