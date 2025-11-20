# Compile inside the directory of each main file so outputs live next to the .tex
$do_cd = 1;

# Compile with XeLaTeX
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';
$pdf_mode = 5;   # 5 = xelatex

# biblatex → biber

use Cwd qw(abs_path);
use File::Basename qw(dirname);

my $repo_root = abs_path(dirname(__FILE__));
$bibtex       = 'biber %O %B';
$use_biber    = 1;
my $example_path  = $repo_root . '/example//';
my $assets_path   = $repo_root . '/assets//';
my $template_path = $repo_root . '/template//';
my $bib_path      = $repo_root . '/ref//';
my $texinputs_add = $example_path . ':' . $assets_path . ':' . $template_path . ':';

if (exists $ENV{'TEXINPUTS'} && length $ENV{'TEXINPUTS'}) {
  $ENV{'TEXINPUTS'} = $texinputs_add . $ENV{'TEXINPUTS'};
} else {
  $ENV{'TEXINPUTS'} = $texinputs_add;
}

if (exists $ENV{'XDVIPDFMXINPUTS'} && length $ENV{'XDVIPDFMXINPUTS'}) {
  $ENV{'XDVIPDFMXINPUTS'} = $assets_path . ':' . $ENV{'XDVIPDFMXINPUTS'};
} else {
  $ENV{'XDVIPDFMXINPUTS'} = $assets_path . ':';
}

if (exists $ENV{'BIBINPUTS'} && length $ENV{'BIBINPUTS'}) {
  $ENV{'BIBINPUTS'} = $bib_path . ':' . $ENV{'BIBINPUTS'};
} else {
  $ENV{'BIBINPUTS'} = $bib_path . ':';
}

$biber      = $bibtex;

$xdvipdfmx  = 'xdvipdfmx %O -o %D %S';
