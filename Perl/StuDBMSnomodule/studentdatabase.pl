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
	chomp($userAction);
	$userAction = <stdin>;
	print "you have selected option = $userAction\n";
	sleep(1);
}
		
sub addUser{
	header();
	print "ADD NEW STUDENT DATA\n\n";
	print "Enter student NAME :";
	$name = <stdin>;
	print "Enter student AGE :";
	$age = <stdin>;
	print "Enter student Phone Number :";
	$phone = <stdin>;
	insertUser($name,$age,$phone);
}

sub searchFromUser{
	header();
	print "Search STUDENT DATA\n\n";
	print "Enter student NAME :";
	$searchname = <stdin>;
	searchUser($searchname);
}

open(FILE, '+>>', 'student.txt') or die "Couldn't open file file.txt, $!";	

sub deletefromUser{
	header();
	print "DELETE STUDENT DATA\n\n";
	print "Enter a Name to Delete :";
	$deletename = <stdin>;
	chomp($deletename);
	open(FILE, '<', 'student.txt') or die "Couldn't open file file.txt, $!";
	foreach(<FILE>){
	@filedata = split('~', $_);
	($matchname) = $filedata[0];
	if($deletename eq $matchname){
		$delline0 = delete(@filedata[0]);
		$delline1 = delete(@filedata[1]);
		$delline2 = delete(@filedata[2]);
		@matcheddata = join( "~", "$delline0", "$delline1", "$delline2" );
		print "@matcheddata";
		deleteUser(@matcheddata);
		sleep(1);
		}	
	}
}
sub deleteUser{
	open(FILE, '<', 'student.txt');
	open(FILE1, '+>', 'updatestudent.txt');
	foreach (<FILE>){
		@datafile = $_;
		print FILE1 $_ unless /@matcheddata/;
	}
}



sub insertUser{
	($name,$age,$phone) = @_;
	chomp($name);
	chomp($age);
	chomp($phone);
	print FILE "$name~$age~$phone\n";
	print "Inserted the information into database successfully\n";
}
	
sub readFile{
	open(FILE, '<', 'student.txt') or die "Couldn't open file file.txt, $!";
	while(<FILE>){
		print "$_\n";
		sleep(1);
	}
	close(FILE);
}
			
sub searchUser{
	header();
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


	
sub process
{
	if ($userAction == 1){
		addUser();
		option();
		inputData();
		process();
	}
	elsif ($userAction == 2){
		readFile();
	}
	elsif ($userAction == 3){
		searchFromUser();
		option();
		inputData();
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
		inputData();
		process();
		}
	}
}

sub main{
	header();
	option();
	inputData();
	process();
	}
		
main();








