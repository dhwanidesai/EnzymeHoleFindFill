#!/usr/bin/perl
use Graph::Directed; #use Graph::Base;
use Storable;
$d=new Graph::Directed;
open (FH,"edge_file.unique");
@data=<FH>;
foreach $line(@data)
{
chomp $line;
@temp=split '\t',$line;
$d=$d->add_edge($temp[0],$temp[2]);	
$d=$d->add_edge($temp[2],$temp[1]); 
#Adds the edge defined by the vertices $u, $v, to the graph $G. Also implicitly adds the vertices. Returns the graph
}
store $d, 'metabolic_graph.out';
