use v5.14;
use strict;
use Test::More;

package Foo {
	sub new { bless []=> shift }
	sub foo { return "foo" }
}

package Foo::Bar {
	BEGIN { our @ISA = 'Foo' }
	use Class::Method::ModifiersX::Override;
	override foo => sub {
		return uc super;
	};
}

is( Foo::Bar->new->foo, "FOO" );
done_testing();
