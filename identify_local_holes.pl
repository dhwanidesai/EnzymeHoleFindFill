# perl identify_local_hole.pl <complete_ec_list> <complete_ec_list.neighbor.sort>
use strict;
use warnings;
use Storable;
use Graph::Directed;
use Data::Dumper;
my $d= retrieve ('EE_graph.out');
my $mtb_ec_file=shift;### file conatining all ec_list i.e. complete_ec_list
open(FM,$mtb_ec_file);
my @mtb_ec_data=<FM>;
close FM;
my %hash=();
my @array=();
my @in_out=();
foreach(@mtb_ec_data)
{
        chomp $_;
        $hash{$_}='1';
}

my $file=shift;
open(F,"$file")||die "can not open list of vertices files";### file conatining all ec_list i.e. complete_ec_list.neighbor.sort
my @data=<F>;
close F;
foreach  my $line(@data)
{
        chomp $line;
        my @out_edge = $d->out_edges($line);
        my @new_out_edge = grep ! /$line/, @out_edge;
	my @in_edge = $d->in_edges($line);
        my @new_in_edge = grep ! /$line/, @in_edge;
	push( @in_out, (@new_out_edge, @new_in_edge) );
	foreach(@in_out)
	{
		chomp $_;
		if (defined $hash{$_})
		{
			push(@array,$_);
		}
	} 
#print "for $line scalar all=",scalar @in_out,"\t", "scalar matched=", scalar @array, "\n";
if (scalar @array==scalar @in_out)
{
	#print "$line","\t",scalar @new_out_edge,"\t", @new_out_edge, "\t", scalar @new_in_edge,"\t",@new_in_edge,"\t", scalar @in_out,"\t",scalar @array, "\n";
	print "$line","\t",scalar @new_out_edge,"\t", @new_out_edge, "\t", scalar @new_in_edge,"\t",@new_in_edge,"\t", scalar @in_out,"\n";
}
@array=();
@in_out=();
}
