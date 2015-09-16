#!/usr/bin/perl

$type=shift or die("I need a type (land, sea, eather etc.)\n");

if(!-d $type)
{
    print "Creating |$type|\n";
    mkdir $type;
}

$terrain='';
$freq='';
$count=-1;
while(<>)
{
    chomp;
    if($_)
    {
        if(! /[^A-Z ,]/) #Change terrain
        {
            %seen=();
            s/\s+/_/g;
            s/,//g;
            $_=lc;
            if(!-d "$type/$_")
            {
                print "Creating |$type/$_|\n";
                mkdir "$type/$_";
            }
            $terrain=$_;
        }
        elsif(/(common|uncommon|rare|very rare)/i)
        {
            if($count==0)
            {
                print OUTP "No encounter\n";
            }

            close OUTP if($freq);
            $freq=lc $1;
            print "found $freq\n";
            $filename="$type/$terrain/$freq";
            print "$filename\n";
            open(OUTP, ">$filename") or die("No openy $filename\n");
            $count=0;
        }
        else
        {
            die("$_ already seen in $terrain\n") if($seen{$_});
            $seen{$_}=1;
            $count++;
            print OUTP "$_\n";
        }
    }
}

if($count==0)
{
    print OUTP "No encounter\n";
}

close OUTP;
