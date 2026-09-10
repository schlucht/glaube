# .latexmkrc


use Cwd 'abs_path';
my $root_dir = abs_path(__FILE__);

print "TEXINPUTS=$ENV{'TEXINPUTS'}\n";


$out_dir = 'build';
$aux_dir = 'build';

$ENV{'TEXINPUTS'} =
'$root_dir/inc/classes//:' .
'$root_dir/inc//:' .
'$root_dir/assets//:';





