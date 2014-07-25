#!/usr/bin/env perl
use Getopt::Long;
# http://perldoc.perl.org/Getopt/Long.html
my $Version;

GetOptions (
          "version|v"  => \$Version # flag
          )   
or die("Error in command line arguments\n");
# 获取命令行参数设置标志位
if(defined $Version){
	print "version 0.1 \n"
}
