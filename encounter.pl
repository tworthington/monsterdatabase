#!/usr/bin/perl

$terrain= shift or die("I need a terrain to generate an encounter in\n");

die("The terrain value has to be a directory\n") if(! -d $terrain);

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
    
