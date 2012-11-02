use v5.14;
use strict;
use Test::More;

package Foo {
	sub new { bless []=> shift }
	sub foo { return "foo" }
}

package Bar {
	use Role::Tiny;
	use Role::TinyX::Override;
	override foo => sub {
		return uc super;
	};
}

package Foo::Bar {
	BEGIN { our @ISA = 'Foo' };
	use Role::Tiny::With;
	with qw(Bar);
}

is( Foo::Bar->new->foo, "FOO" );
done_testing();
