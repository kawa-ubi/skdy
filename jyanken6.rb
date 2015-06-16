class Jyanken
	def initialize
		@poi_hand = nil
	end
	
	attr_reader :poi_hand
	
	def poi
		@poi_hand = hand()
	end
	
	def hand
		rand 3
	end
	
	def to_s
		hands = ["グー", "チョキ", "パー"]
		if @poi_hand
			hands[@poi_hand]
		else
			@poi_hand
		end
	end
	
	def judge(aite)
		case (@poi_hand - (aite.poi_hand + 3)) % 3
		when 0
			'引き分け'
		when 1
			'まけ'
		when 2
			'勝ち'
		end
	end
end

a = Jyanken.new
b = Jyanken.new

10.times do |n|
	a.poi
	b.poi
	puts "#{n+1}回戦"
	puts "Aさん：#{a}  Bさん：#{b}"
	puts "勝負 = Aさんの#{a.judge(b)}"	
end
