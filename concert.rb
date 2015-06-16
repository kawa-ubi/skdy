class Customer
	def initialize(name)
		@name = name
	end

	def buy(ticket)
		ticket.sell(self)
	end
		
	attr_reader :name
end


class Ticket
	def initialize(name, price)
		@buyers = []
		@name = name
		@price = price
	end
	
	def sell(customer)
		@buyers << customer if customer
	end
	
	def total_sales
		@buyers.size * @price
	end
		
	attr_reader :buyers
end


# main
yamada = Customer.new("Taro Yamada")
kawada = Customer.new("Jiro Kawada")
oakada = Customer.new("Saburo Okada")

mozart = Ticket.new("Piano Concerto No.24", 5000)
wagner = Ticket.new("Tristan und Isolde", 10000)

yamada.buy(mozart)
kawada.buy(wagner)
oakada.buy(wagner)
wagner.sell(yamada)
mozart.sell(oakada)

for customer in wagner.buyers
  puts customer.name
end

puts wagner.total_sales


#
# expected outputs.
#

# Jiro Kawada
# Saburo Okada
# Taro Yamada
# 30000
