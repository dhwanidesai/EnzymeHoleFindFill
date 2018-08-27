#!/usr/bin.perl
open(F,"connections");## a file having all the connections
my @data=<F>;
close F;
open (OUT,">edge_file");
foreach my $line(@data)
{
chomp $line;
my @temp=split '\t',$line;
$x=scalar @temp;
for ($i=0;$i<$x;$i++)
{
if ($temp[$i]=~/[0-9|-]+\.[0-9|-]+\.[0-9|-]+\.[0-9|-]/)
{
push(@ec,$temp[$i]);
}
else
{
push(@non_ec,$temp[$i]);
}
}
$n_nonec=scalar @non_ec;
$n_ec=scalar @ec;
for ($j=0;$j<=($n_nonec/2);$j+=2)
{
for ($k=0;$k<$n_ec;$k++)
{
print OUT "$non_ec[$j]\t$non_ec[$j+1]\t$ec[$k]\n" }
} @ec=(); @non_ec=();
}
close OUT;
