#!/usr/bin/perl

$master=shift or die("I need a master file of acceptable monsters\n");
$oldlist=shift or dir("I need an old list of monsters to filter\n");

open(INP,"<$master") or die("Can't open master file $master to read\n");

%allowed=();
while(<INP>)
{
    s/^\s+|\s+$//g;
    if($_ &&
       ((!/[^A-Z ,]/) || 
        /(common|uncommon|rare|very rare)/i)
        )
    {
        $allowed{$_}=1;
    }
}

close INP;

open(INP,"<$oldlist") or die("Can't open old list of monsters $oldlist to read\n");

while(<INP>)
{
    s/^\s+|\s+$//g;
    if($_)
    {
        if((!/[^A-Z ,]/) || 
           /(common|uncommon|rare|very rare)/i ||
           $allowed{$_}==1 ) 
        {
            print "$_\n";
        }

    }
}

close INP;
