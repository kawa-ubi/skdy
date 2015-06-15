#
# 6.2 code writing. Question 2.
#

def get_janken(name)
	DATA = %w(グー チョキ パー)
	ransuu = rand 3
	te = DATA[ ransuu ]
	p "#{name}さん：#{te}"
	return ransuu
end

player_a = get_janken('A')
player_b = get_janken('B')

def hantei(a,b)
	message = ''
	case (a - (b + 3)) % 3
	when 0
		message = '引き分け'
	when 1
		message = 'Bさんの勝ち'
	when 2
	 	message = 'Aさんの勝ち'
	end
	p "  勝敗 = #{message}"
end

hantei( player_a , player_b )
