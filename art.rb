@ten = <<BODY
:cloud::cloud::moneybag::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud:
:moneybag::moneybag::moneybag::moneybag::moneybag:
:cloud::cloud::moneybag::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud:
BODY

@nine = <<BODY
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::moneybag::cloud:
:cloud::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
BODY

@eight = <<BODY
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
BODY

@seven = <<BODY
:moneybag::moneybag::moneybag::moneybag::moneybag::cloud:
:moneybag::cloud::cloud::moneybag::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud::cloud:
:cloud::moneybag::cloud::cloud::cloud::cloud:
:cloud::moneybag::cloud::cloud::cloud::cloud:
:cloud::moneybag::cloud::cloud::cloud::cloud:
:cloud::cloud::cloud::cloud::cloud::cloud:
BODY

@six = <<BODY
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::cloud::cloud:
:moneybag::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
BODY

@five = <<BODY
:moneybag::moneybag:::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::cloud::cloud:
:moneybag::cloud::cloud::cloud::cloud::cloud:
:moneybag::moneybag::moneybag::moneybag::cloud::cloud:
:cloud::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
BODY

@four = <<BODY
:moneybag::cloud::cloud::cloud::cloud::cloud:
:moneybag::cloud::cloud::moneybag::cloud::cloud:
:moneybag::cloud::cloud::moneybag::cloud::cloud:
:moneybag::cloud::cloud::moneybag::cloud::cloud:
:moneybag::moneybag::moneybag::moneybag::moneybag::cloud:
:cloud::cloud::cloud::moneybag::cloud::cloud:
:cloud::cloud::cloud::moneybag::cloud::cloud:
BODY

@three = <<BODY
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:cloud::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
BODY

@two = <<BODY
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::moneybag::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::cloud::cloud:
:moneybag::cloud::cloud::cloud::cloud::cloud:
:moneybag::moneybag::moneybag::moneybag::moneybag::cloud:
BODY

@one = <<BODY
:cloud::cloud::moneybag::cloud::cloud::cloud:
:cloud::moneybag::moneybag::cloud::cloud::cloud:
:moneybag::cloud::moneybag::cloud::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud::cloud:
:moneybag::moneybag::moneybag::moneybag::moneybag::cloud:
BODY

@zero = <<BODY
:cloud::cloud::moneybag::cloud::cloud::cloud:
:cloud::moneybag::cloud::moneybag::cloud::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:moneybag::cloud::cloud::cloud::moneybag::cloud:
:cloud::moneybag::cloud::moneybag::cloud::cloud:
:cloud::cloud::moneybag::cloud::cloud::cloud:
BODY

def uriage(uriage)
  case uriage
  when 10
    @ten
  when 9
  	@nine
  when 8
  	@eight
  when 7
  	@seven
  when 6
  	@six
  when 5
  	@five
  when 4
  	@four
  when 3
  	@three
  when 2
  	@two
  when 1
  	@one
  when 0
	@zero
  else
    ':moneybag:' * uriage.to_i
  end
end
