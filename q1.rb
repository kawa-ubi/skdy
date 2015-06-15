#
# 6.2 code writing. Question 1.
#

def janken
	data = %w(グー チョキ パー)
	p data[rand 3]
end

for i in (1..10)
	janken()
end
