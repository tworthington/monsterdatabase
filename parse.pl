#!/usr/bin/perl

$type=shift or die("I need a type (land, sea, eather etc.)\n");

if(!-d $type)
{
    print "Creating |$type|\n";
    mkdir $type;
}

$terrain='';
$freq='';
while(<>)
{
    chomp;
    if($_)
    {
        if(! /[^A-Z ,]/) #Change terrain
        {
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
            close OUTP if($freq);
            $freq=lc $1;
            print "found $freq\n";
            $filename="$type/$terrain/$freq";
            print "$filename\n";
            open(OUTP, ">$filename") or die("No openy $filename\n");
        }
        else
        {
            print OUTP "$_\n";
        }
    }
}

    close OUTP;
