# .latexmkrc


use Cwd qw(abs_path getcwd);
use File::Basename qw(dirname);
use File::Spec;

my $root_dir = abs_path(getcwd());
while (1) {
	my $marker = File::Spec->catfile($root_dir, 'inc', 'classes', 'mybib.cls');
	last if -e $marker;

	my $parent = dirname($root_dir);
	die "Could not locate project root containing inc/classes/mybib.cls (cwd: " . getcwd() . ")\n"
		if $parent eq $root_dir;

	$root_dir = $parent;
}

my $is_windows = ($^O =~ /mswin|mingw|msys|cygwin/i) || defined $ENV{'WINDIR'};
if ($is_windows && $root_dir =~ m{^/([a-zA-Z])/(.*)$}) {
	$root_dir = uc($1) . ':/' . $2;
}

my $path_sep = $is_windows ? ';' : ':';

$ENV{'TEXINPUTS'} = join(
	$path_sep,
	"$root_dir/inc/classes//",
	"$root_dir/inc//",
	"$root_dir/assets//",
	"$root_dir/src//",
	''
);

print "latexmkrc loaded: $root_dir/.latexmkrc\n";
print "TEXINPUTS=$ENV{'TEXINPUTS'}\n";

$out_dir = "$root_dir/build";
$aux_dir = "$root_dir/build";





