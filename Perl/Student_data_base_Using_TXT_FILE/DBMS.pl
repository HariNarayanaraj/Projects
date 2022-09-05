#!usr/bin/perl
BEGIN{
	push(@INC, "D:\Perl\StudentDBMS\student.txt");
}


use lib;
use menu;

sub main{
	
	menu::header();
	menu::option();
	menu::process();
	}
	
END{
	print "Program Ended";
}
		
main();








