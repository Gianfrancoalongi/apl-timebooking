#!/usr/bin/perl
use IO::Socket; 

sub send_receive_test {
    my $sock = new IO::Socket::INET ( 
	PeerAddr => 'localhost',
	PeerPort => '52200',
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
send_receive_test("book all 2 7 5 abba","added a new calendar for abba");
