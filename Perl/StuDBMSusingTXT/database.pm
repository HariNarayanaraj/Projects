package database;

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(insertUser searchUser deleteUser);
	
open(FILE, '+>>', 'D:\Perl\StudentDBMS\student.txt') or die "Couldn't open file file.txt, $!";	

sub insertUser{
	($name,$age,$phone) = @_;
	chomp($name);
	chomp($age);
	chomp($phone);
	print FILE "$name~$age~$phone\n";
	print "Inserted the information into database successfully\n";
}

sub searchUser{
	($searchname) = @_;
	chomp($searchname);
	$found = false;
	open(FILE, '<', 'student.txt') or die "Couldn't open file file.txt, $!";
	foreach(<FILE>){
	@filedata = split('~', $_);
	($matchname) = $filedata[0];
	if($searchname eq $matchname){
		print "@filedata\n";
		sleep(1);
		$found = true;
		}
	}
 	if($found eq false){
		print "NOT FOUND\n";
		sleep(2);
	}
	return($matchname);
}

sub deleteUser{
	($matchedData) = @_;
	@Exactline = $matchedData;
	open(FILE, '<', 'student.txt');
	open(UPDATED, '+>', 'updatestudent.txt');
	foreach (<FILE>){
		@datafile = $_;
		print UPDATED $_ unless /@Exactline/;
	}
}


1;
		