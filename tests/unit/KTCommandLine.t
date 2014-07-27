#!/usr/bin/perl
#================
# FILE          : KTCommandLine.t
#----------------
# PROJECT       : openSUSE Build-Service
# COPYRIGHT     : (c) 2012 SUSE LLC
#               :
# AUTHOR        : Robert Schweikert <rjschwei@suse.com>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : Unit test driver for the KIWILocator module.
#               :
# STATUS        : Development
#----------------
package KTCommandLine;
use strict;
use warnings;
use FindBin;
use Test::Unit::Lite;

# Location of test cases according to program path
use lib "$FindBin::Bin/lib";
# http://search.cpan.org/~rjbs/perl-5.20.0/lib/FindBin.pm

# Location of Kiwi modules relative to test
use lib "$FindBin::Bin/../../modules";

my $runner = Test::Unit::HarnessUnit->new();
# https://github.com/gnuhub/perl-Test-Unit-Lite/blob/master/lib/Test/Unit/Lite.pm#L758
# 继承自 http://search.cpan.org/~mcast/Test-Unit-0.25/lib/Test/Unit/TestRunner.pm
$runner->start( 'Test::kiwiCommandLine' );

1;
