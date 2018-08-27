#!/usr/bin/perl
use strict;
use warnings;
# USAGE ::: perl <program.pl> <database_file> 

my $file=shift; ## the name of databse file is bioDB_updated.csv
open(FILE,$file);
open(OUT,">connections");
my @data=<FILE>;
close FILE;
my $i; my @temp=();
foreach my $line(@data)
{
chomp $line;
@temp=split '\t',$line;
for($i=5;$i<@temp;$i++)
{
if(($temp[$i]!~/[A-F]/i)&&($temp[$i]!~/[H-Z]/i)&&($temp[$i]))
{
print OUT "$temp[$i]\t";
}
}
$i=5; #reinitialise the value of i to 5 so as to start from the column having connections in the next loop
print OUT "\n";
}
system "sed -i '/^\$/d' connections"; #remove blank lines from the generated file
system "sed -i 's/\"//g' connections"; #remove '"' from the generated file 
close OUT;
