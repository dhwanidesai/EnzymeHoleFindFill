use lib '/home/swat/laptop_stuff/swati/bin/Graph-0.94/lib';
use Storable;
use Graph::Directed;
use Data::Dumper;
$d= retrieve ('EE_graph.out');
my $file=shift;
open(F,"$file")||die "can not open list of vertices files";
@data=<F>;
close F;
open (OUT,">edges_count");
foreach $line(@data)
{
	chomp $line;
	@out_edge = $d->out_edges($line);
	#print OUT "for $line out_edge", "\t",scalar @out_edge,"\t";
	#print "out...@out_edge\n";
	my @new_out_edge = grep ! /$line/, @out_edge;
	#print "new out-----@new_out_edge\n";
	print OUT $line, "\t",scalar @new_out_edge,"\t";
	@in_edge = $d->in_edges($line);
	#print "in....@in_edge\n";
	my @new_in_edge = grep ! /$line/, @in_edge;
	#print "new in---@new_in_edge\n";
	print OUT scalar @new_in_edge,"\n";
	
=cut
if ((scalar @out_edge==2 && scalar@in_edge==2))
	{
		for($i=0;$i<2;$i++)
		{
#			print "edges\t@in_edge\t@out_edge\n";
			print "$in_edge[$i]\t$out_edge[$i]\t"
		}
		print "\n";
		print OUT "$line\n";
	}
=cut
}
