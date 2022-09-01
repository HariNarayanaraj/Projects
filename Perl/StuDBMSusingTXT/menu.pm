package menu;

use database;
use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(header option readFile addFromUser searchFromUser deletefromUser process);
	
sub header{
	system("cls");
	print "=====================================\n";
	print "collage of India\n";
	print "=====================================\n";
}

sub option{
	print "Choose your Option\n\n";
	print "1.Add new Student\n"; 
	print "2.show student Data\n";
	print "3.Search Student\n";
	print "4.Delete Student\n";
	print "5.Exit\n";
}

sub inputData{
	$userAction = <STDIN>;
	chomp($userAction);
	print "you have selected option = $userAction\n";
	
}

sub addFromUser{
	header();
	print "ADD NEW STUDENT DATA\n\n";
	print "Enter student NAME :";
	$name = <STDIN>;
	print "Enter student AGE :";
	$age = <STDIN>;
	print "Enter student Phone Number :";
	$phone = <STDIN>;
	database::insertUser($name,$age,$phone);
}
sub readFile{
	open(FILE, '<', 'student.txt') or die "Couldn't open file file.txt, $!";
	while(<FILE>){
		print "$_\n";
		sleep(1);
	}
	close(FILE);
}

sub searchFromUser{
	header();
	print "Search STUDENT DATA\n\n";
	print "Enter student NAME :";
	$searchname = <STDIN>;
	database::searchUser($searchname);
}

sub deletefromUser{
	header();
	print "DELETE STUDENT DATA\n\n";
	print "Enter a Name to Delete :";
	$deletename = <STDIN>;
	chomp($deletename);
	open(FILE, '<', 'student.txt') or die "Couldn't open file file.txt, $!";
	foreach(<FILE>){
	@filedata = split('~', $_);
	($matchname) = $filedata[0];
	if($deletename eq $matchname){
		$dellinename = delete(@filedata[0]);
		$dellineage = delete(@filedata[1]);
		$dellinephone = delete(@filedata[2]);
		$matchedData = join( "~", "$dellinename", "$dellineage", "$dellinephone" );
		print "$matchedData";
		database::deleteUser($matchedData);
		sleep(1);
		}	
	}
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
		print "you are successfully EXIT\n";
		exit();
	}
	else{
		while($userAction => 6)
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
