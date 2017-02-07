use strict;
use warnings;
use Test::More;

BEGIN {
	eval { require Moo }
		or plan skip_all => 'requires Moo';
};

{
	package Local::Role1;
	use Moo::Role;
	use MooX::Override -role;	
	override meth => sub { 1 };
	no Moo::Role;
}

{
	package Local::Role2;
	use Moo::Role;
	use MooX::Override -role;
	override meth => sub { 2 };
	no Moo::Role;
}

ok not eval q{
	package Local::Class;
	use Moo;
	with qw( Local::Role1 Local::Role2 );
	sub meth { 42 }
};

like($@, qr{monkey});

done_testing();
