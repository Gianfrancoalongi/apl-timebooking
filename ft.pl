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
    print "test[$_[0]]:$res\n";
    close($sock);
}

send_receive_test("add abba","added a new calendar for abba");
send_receive_test("show abba","abba OOO OOO OOO");
send_receive_test("add room1","added a new calendar for room1");
send_receive_test("add room2","added a new calendar for room2");
send_receive_test("book all 2 7 5 room1 room2","booked slots 2 3 4 5 6");
send_receive_test("show room1","room1 OXX XXX OOO");
send_receive_test("show room2","room2 OXX XXX OOO");
send_receive_test("remove room1 room2 abba","removed abba room1 room2");
send_receive_test("stop","stopped server");
