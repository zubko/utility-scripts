#!/usr/bin/perl

# from https://gist.github.com/railwaycat/4043945

# Emacs starter for Emacs mac port

# Thanks to Aquamacs Project and David Reitter

my $args = "";
my $tmpfiles = "";

for my $f (@ARGV) {
  $args .= '"'.$f.'" ';
  $tmpfiles .= '"'.$f.'" ' if (! -e $f);
}

system("touch $args") if ($tmpfiles);
 
system("open -a /Applications/Emacs.app $args");

# delay deletion because AE drag&drop doesn't work with non-existing documents
system("(sleep 3; rm $tmpfiles) &") if ($tmpfiles);
 
exit;
