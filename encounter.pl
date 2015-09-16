#!/usr/bin/perl

$terrain= shift or die("I need a terrain to generate an encounter in\n");

die("The terrain value has to be a directory\n") if(! -d $terrain);

$dmgflag=shift || 0;


if($dmgflag && $terrain=~/land/)
{
    if($terrain=~/civilized/)
    {
        if(int(rand(20)+1)<6)
        {
            print "Patrol\n";
            exit;
        }
    }
    elsif($terrain=~/wilderness/)
    {
        if(int(rand(20)+1)<2)
        {
            print "Stronghold:\t";
            print pickone(100,(10,'Small shell keep (small)',
                               25,'Tower (small)',
                               35,'Moat house or friary (small)',
                               45,'Large shell keep (medium)',
                               65,'Small walled castle with keep (medium)',
                               80,'Medium walled castle with keep (medium)',
                               88,'Concentric castle (large)',
                               95,'Large walled castle with keep (large)',
                               100,'Fortress complex (large)')
                );
            print "\n";
            exit;
        }
    }
}

$n=int(rand(100))+1;

if($n<66)
{
    $f='common';
}
elsif($n<86)
{
    $f='uncommon';
}
elsif($n<98)
{
    $f='rare';
}
else
{
    $f='very rare';
}

$filename="$terrain/$f";

die("Can't find $filename\n") unless( -f $filename);

print `sort -R "$filename"|head -1`;
    
sub pickone
{
    my $sides=shift;
    my %results=@_;

    my $roll=int(rand($sides)+1);

    foreach( sort { $a <=> $b } keys %results )
    {
        if($_>=$roll)
        {
            return $results{$_};
        }
    }
}
