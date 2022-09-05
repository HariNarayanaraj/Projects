package database;
use lib;
use DBI;

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(insertUser searchUser deleteUser updateData);
	
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
	($student_name,$student_age,$student_phone) = @_;
	chomp($student_name);
	chomp($student_age);
	chomp($student_phone);
	print "$student_name~$student_age~$student_phone\n";
	$sth = $dbh->prepare("INSERT INTO STUDENTTABLE(Name, Age, Phone)
				VALUES(?,?,?)");
	$sth->execute($student_name,$student_age,$student_phone) or die $DBI::errstr;
	$sth->finish();
}
 
sub readDataBase{
	connectdatabase();
	$sth = $dbh->prepare("SELECT * FROM STUDENTTABLE");
	$sth->execute() or die $DBI::errstr;
	while (@row = $sth->fetchrow_array()){
		($Name,$Age,$Phone) = @row;
		print "$Name - $Age - $Phone\n";
		sleep(1);
	}
	$sth->finish();
}
sub searchUser{
	connectdatabase();
	($search_name) = @_;
	chomp($search_name);
	$found = false;
	$sth = $dbh->prepare("SELECT Name,Age,Phone FROM STUDENTTABLE
	WHERE Name = ?");
	$sth->execute($search_name) or die $DBI::errstr;
	while (@row = $sth->fetchrow_array()){
		($search_name) eq @row; 
			print "@row\n";
			sleep(2);
			$found = true;
	$sth->finish();
	}
	if ($found eq false) {
		print "Student Not Found\n";
	}
}

sub deleteUser{
	connectdatabase();
	($delete_name) = @_;
	chomp($delete_name);
	$sth = $dbh->prepare("DELETE FROM STUDENTTABLE
	WHERE Name = ?");
	$sth->execute($delete_name) or die $DBI::errstr;
	print "Student $delete_name Data has been Deleted \n";
	sleep(1);			
}

sub updateData{
	connectdatabase();
	($student_name,$Update_phone) = @_;
	chomp($student_name);
	chomp($Update_phone);
	print "$student_name-$Update_phone\n";
	sleep(1);	
	$sth = $dbh->prepare("UPDATE STUDENTTABLE
	SET Phone = ?
	WHERE Name = ?");
	$sth->execute($Update_phone,$student_name) or die $DBI::errstr;
	$sth->finish();
}
1;
		