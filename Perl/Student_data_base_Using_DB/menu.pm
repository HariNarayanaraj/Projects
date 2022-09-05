package menu;

use database;
use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(header option readFile addFromUser searchFromUser deletefromUser UpdatefromUser process);
	
sub header{
	system("cls");
	print "=====================================\n";
	print "Collage of India\n";
	print "=====================================\n";
}

sub option{
	print "Choose your Option\n\n";
	print "1.Add new Student\n"; 
	print "2.show student Data\n";
	print "3.Search Student\n";
	print "4.Delete Student\n";
	print "5.Update Student Details\n";
	print "6.Exit\n";
}

sub inputData{
	$userAction = <STDIN>;
	chomp($userAction);
	print "you have selected option = $userAction\n";
	
}

sub addFromUser{
	header();
	print "ADD NEW STUDENT DATA\n\n";
	print "Enter Student NAME :";
	$student_name = <STDIN>;
	print "Enter Student AGE :";
	$student_age = <STDIN>;
	print "Enter Student Phone Number :";
	$student_phone = <STDIN>;
	database::insertIntoDatabase($student_name,$student_age,$student_phone);
}

sub readFile{
	database::readDataBase();
	
}

sub searchFromUser{
	header();
	print "Search STUDENT DATA\n\n";
	print "Enter student NAME :";
	$search_name = <STDIN>;
	database::searchUser($search_name);
}

sub deletefromUser{
	header();
	print "DELETE STUDENT DATA\n\n";
	print "Enter a Name to Delete :";
	$delete_name = <STDIN>;
	database::deleteUser($delete_name);
}

sub UpdatefromUser{
	header();
	print "Update STUDENT DATA\n\n";
	print "Enter Student NAME :";
	$student_name = <STDIN>;
	print "Enter Update PhoneNumber :";
	$Update_phone = <STDIN>;
	database::updateData($student_name,$Update_phone);
}
	
	
sub process{
	inputData();
	if ($userAction == 1){
		addFromUser();
	}
	elsif ($userAction == 2){
		readFile();
	}
	elsif ($userAction == 3){
		searchFromUser();	
	}
	elsif ($userAction == 4){
		deletefromUser();	
	}
	elsif ($userAction == 5){
		UpdatefromUser();	
	}
	elsif ($userAction == 6){
		print "You Are Successfully EXIT\n";
		exit();
	}
	else{
		while($userAction => 7)
		{
		print "Wrong Option\n\n";
		sleep(1);
		print "Please Press Correct Option.\n";
		sleep(1);
		option();
		process();
		}
	}
}

1;
