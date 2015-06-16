#
# 6.2 code writing. Homework.
#

# 参加人数
N = 5
# 手
TE = ['グー', 'チョキ', 'パー']

# じゃんけんぽん
def get_janken(name)
	ransuu = rand 3
	return ransuu
end

# ハッシュ表示
def disp(data)
	data.each do |k, v|
		if v == 'x'
			puts "#{k} : #{v}"
		else
			puts "#{k} : #{TE[v]}"
		end
	end
end

# 全員でじゃんけん
def janken_all(data)
	grouped_te = data.values.uniq
	new_list = []
	if grouped_te.size == 2
		# 2 - > win/lose
		win_num = get_win_num(grouped_te[0], grouped_te[1])
		# 敗者にマーク
		new_list = data.map do |k, v|
			v == win_num ? [k, v] : [k, 'x']
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
def get_win_num(a, b)
	win_num = nil
	case (a - (b + 3)) % 3
	when 0
		# あいこ
		win_num = nil
	when 1
		# aの勝ち
		win_num = b
	when 2
		# bの勝ち
	 	win_num = a
	end
	win_num
end

# メンバー数のrange/配列からじゃんけんデータ用hashを作成
def create_data(members)
	list = members.map do |n|
		[n, get_janken(n)]
	end
	data = list.to_h
end

# main()
kekka_data = nil
player_data = create_data( (1..N) )
ii = 0
while player_data.size > 1
	ii += 1
	puts "第#{ii}回戦 ---------------------------"
	kekka_data = janken_all(player_data)
	disp kekka_data
	
	# 敗者を削除	
	player_data = kekka_data.reject do |k, v|
		v == 'x'
	end
	
	player_data = create_data(player_data.keys)
	puts "勝ち残ったのは =  #{player_data.keys}"
	
	puts "優勝者は #{player_data.keys} さんでした!!" if player_data.size == 1 
end
