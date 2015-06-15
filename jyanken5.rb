#
# 6.2 code writing. Homework.
#

N = 5
TE = ['グー', 'チョキ', 'パー']

# じゃんけんぽん
def get_janken(name)
	ransuu = rand 3
	te = TE[ ransuu ]
	return ransuu
end

# ハッシュ表示
def disp(data)
	data.each do |k,v|
		if v == 'x'
			puts "#{k} : #{v}"
		else
			puts "#{k} : #{TE[v]}"
		end
	end
end

# 全員でじゃんけん
def janken_all(data)
	un = data.values.uniq
	new_list = []
	if un.size == 2
		# 2 - > win/lose
		win_num = get_win_num( un[0],un[1] )
		new_list = data.map do |k,v|
			v == win_num ? [k,v] : [k,'x']
		end
		puts "かち手：#{TE[win_num]}"
		return new_list.to_h
	else
		# 1,3 -> aiko
		puts 'あいこ'
		return data
	end
end

# かち手の決定
def get_win_num(a,b)
	win_num = ''
	case (a - (b + 3)) % 3
	when 0
		win_num = ''
	when 1
		win_num = b
	when 2
	 	win_num = a
	end
	win_num
end

# create_data
def create_data(members)
	list = members.map do |n|
		[n, get_janken(n)]
	end
	data = list.to_h
end

# main()
data = create_data( (1..N) )
winners = data
kekka = data
ii = 0
while winners.size > 1
	ii += 1
	p "第#{ii}回戦 ---------------------------"
	kekka = janken_all(winners)
	disp kekka
	
	winners = kekka.reject do |k,v|
		v == 'x'
	end
	
	winners = create_data(winners.keys)
	p "勝ち残ったのは =  #{winners.keys}"
	
	p "優勝者は #{winners.keys} さんでした!!" if winners.size == 1 
end
