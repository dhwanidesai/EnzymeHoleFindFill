#!/usr/bin/perl -w
use strict;
use Storable;
use Graph::Directed;
my $d= retrieve ('EE_graph.out'); 
my $file=shift; # file conatining all ec_list i.e. complete_ec_list
open(F,$file);
my @data=<F>;
close F;
my %hash=();
foreach (@data)
{
	chomp $_;
	$hash{$_}='1';
}
open(OUT,">$file.nighbor");
	foreach my $line(@data)
	{
		chomp $line;
		my @n = $d->neighbors($line);
		if (@n)
		{
			print "for EC" ,$line,"\n";
			foreach my $neighbor(@n)
			{
			if(defined $hash{$neighbor})
				{
				print "$neighbor\n";
				}
			else
				{
				print OUT "$neighbor\n";
				}
			}
		}
	}
