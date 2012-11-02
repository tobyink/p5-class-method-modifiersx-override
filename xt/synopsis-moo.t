use v5.14;
use strict;
use Test::More;

package Foo {
	use Moo;
	sub foo { return "foo" }
}

package Bar {
	use Moo::Role;
	use MooX::Override -role;
	override foo => sub {
		return uc super;
	};
}

package Foo::Bar {
	use Moo;
	extends qw(Foo);
	with qw(Bar);
}

is( Foo::Bar->new->foo, "FOO" );
done_testing();
