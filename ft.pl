#!/usr/bin/perl
use IO::Socket; 

sub send_receive_test {
    my $sock = new IO::Socket::INET ( 
	PeerAddr => 'localhost',
	PeerPort => '52000',
	Proto => 'tcp'
	); 
    die "Could not create socket: $!\n" unless $sock; 
    print $sock $_[0];
    $data = <$sock>;
    if($data ne $_[1]) {
	$res = "failed ($data)";
    }else{
	$res = "passed";
    }
    print "$res..........[$_[0]]\n";
    close($sock);
}

send_receive_test("add abba","added a new calendar for abba");

send_receive_test("show abba","abba OOO OOO OOO");

send_receive_test("add room1","added a new calendar for room1");
send_receive_test("add room2","added a new calendar for room2");
send_receive_test("book all 2 6 room1 room2","booked slots 2 3 4 5 6 7");
send_receive_test("show room1","room1 OXX XXX XOO");
send_receive_test("show room2","room2 OXX XXX XOO");

send_receive_test("remove room1 room2 abba","removed abba room1 room2");
send_receive_test("remove room1 room2","no such bookable room1 room2");

send_receive_test("add abba","added a new calendar for abba");
send_receive_test("remove room1 abba","removed abba");

send_receive_test("show abba","no such bookable abba");

send_receive_test("add p1 p2 p3 p4","added a new calendar for p1 p2 p3 p4");
send_receive_test("book all 1 2 p1","booked slots 1 2");
send_receive_test("book all 2 1 p2","booked slots 2");
send_receive_test("book all 7 1 p2","booked slots 7");
send_receive_test("book all 2 2 p4","booked slots 2 3");
send_receive_test("book all 7 1 p4","booked slots 7");
send_receive_test("book maximize 1 7 2 p1 p2 p3 p4","booked slots 4 5");
send_receive_test("remove p1 p2 p3 p4","removed p1 p2 p3 p4");

send_receive_test("add p1 p2 p3 p4","added a new calendar for p1 p2 p3 p4");
send_receive_test("book all 1 2 p1","booked slots 1 2");
send_receive_test("book all 6 1 p1","booked slots 6");
send_receive_test("book all 2 1 p2","booked slots 2");
send_receive_test("book all 6 1 p2","booked slots 6");
send_receive_test("book all 1 3 p3","booked slots 1 2 3");
send_receive_test("book all 5 2 p3","booked slots 5 6");
send_receive_test("book all 3 1 p4","booked slots 3");
send_receive_test("book mustcould 1 6 2 p1 p2 ; p3 p4","booked slots 4 5");

send_receive_test("stop","stopped server");
