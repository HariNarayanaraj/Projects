package database;
use lib;
use DBI;

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(insertUser searchUser deleteUser);
	
# open(FILE, '+>>', 'D:\Perl\StudentDBMS\student.txt') or die "Couldn't open file file.txt, $!";	
# open(FILE, '+>', 'D:\Perl\Studentdb\student.db') or die "Couldn't open file file.db, $!";

sub insertUser{
	($name,$age,$phone) = @_;
	chomp($name);
	chomp($age);
	chomp($phone);
	print FILE "$name~$age~$phone\n";
	print "Inserted the information into database successfully\n";
}

sub connectdatabase{
	$driver = "SQLite";
	$database = "student.db";
	$dsn = "DBI:$driver:database=$database";
	$userid = " ";
	$password = " ";
	$dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
}	

sub insertIntoDatabase{
	connectdatabase();
	($name,$age,$phone) = @_;
	chomp($name);
	chomp($age);
	chomp($phone);
	print "$name~$age~$phone\n";
	$sth = $dbh->prepare("INSERT INTO STUDENTTABLE(Name, Age, Phone)
	VALUES(?,?,?)");
	$sth->execute($name,$age,$phone) or die $DBI::errstr;
	$sth->finish();
	# $dbh->commit or die $DBI::errstr;
 }

sub searchUser{
	connectdatabase();
	($searchname) = @_;
	chomp($searchname);
	$found = false;
	open(FILE, '<', 'student.db') or die "Couldn't open file file.txt, $!";
	foreach(<FILE>){
	# @filedata = split('~', $_);
	@filedata = $_;
	($matchname) = $filedata;
	# ($matchname) = $filedata[0];
	if($searchname eq $matchname){
		print "@filedata\n";
		print "$matchname\n";
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
	connectdatabase();
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
		