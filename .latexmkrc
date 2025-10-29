# Use build/ for all aux and outputs
$aux_dir = 'build';
$out_dir = 'build';

# Compile with XeLaTeX
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';
$pdf_mode = 5;   # 5 = xelatex

# biblatex → biber

use Cwd qw(abs_path);
use File::Copy qw(copy);

my $repo_root     = abs_path('.');
my $biber_command = "cd \"$repo_root/example\" && biber --input-directory=build --output-directory=build %O %B";
$bibtex    = $biber_command;
$use_biber = 1;
my $example_path  = $repo_root . '/example//';
my $assets_path   = $repo_root . '/assets//';
my $bib_path      = $repo_root . '/ref//';
my $texinputs_add = $example_path . ':' . $assets_path . ':';

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

$biber = $bibtex;

$xdvipdfmx = 'xdvipdfmx %O -o %D %S';

END {
  my $build_dir   = "$repo_root/build";
  my $example_dir = "$repo_root/example";
  if (opendir my $dh, $build_dir) {
    while (my $file = readdir $dh) {
      next unless $file =~ /\.pdf\z/;
      my $src = "$build_dir/$file";
      my $dst = "$example_dir/$file";
      copy($src, $dst) or warn "latexmk: Failed to copy $src to $dst: $!\n";
    }
    closedir $dh;
  }
}
