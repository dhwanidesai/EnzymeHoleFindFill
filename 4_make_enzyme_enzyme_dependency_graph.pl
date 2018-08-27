#!/usr/bin/perl
use Storable;
use Graph::Directed;
$d= retrieve ('metabolic_graph.out');
@vertices=$d->vertices;
foreach $v(@vertices)
{
if ($v =~/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]/)
{
push (@enz,$v);
}
else
{
push (@cpd,$v);
}
}
$new_d=new Graph::Directed;
foreach $e(@enz)
{
%seen=();
$new_d=$new_d->add_vertex($e);
@suc_cpd_temp=$d->successors($e);
@suc_cpd = grep(!$seen{$_}++,@suc_cpd_temp);
foreach $s(@suc_cpd)
{ %seen_new=();
@suc_enz_temp=$d->successors($s);
@suc_enz = grep(!$seen_new{$_}++,@suc_enz_temp);
foreach $se(@suc_enz)
{
$new_d=$new_d->add_edge($e,$se);
}
}
}
store $new_d ,'EE_graph.out';
