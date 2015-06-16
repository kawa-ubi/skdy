class Person
	def initialize(name, h, w)
		@name = name
		@height = h
		@weight = w
	end
	
	attr_accessor :height, :weight
	attr_reader   :name
	
	def bmi
		_bmi = @weight.to_f / ((@height * 0.01) ** 2).to_f
	end
	
	def judge
		# 低体重（痩せ型）	18.5未満
		# 普通体重	18.5以上、25未満
		# 肥満（1度）	25以上、30未満
		# 肥満（2度）	30以上、35未満
		# 肥満（3度）	35以上、40未満
		# 肥満（4度）	40以上
		_bmi = bmi()
		case true
			when _bmi < 18.5
				'やせ'
			when 18.5 <= _bmi && _bmi < 25.0
				'標準'
			when 25.0 <= _bmi && _bmi < 30.0
				'肥満'
			when 30.0 <= _bmi && _bmi < 35.0
				'高度肥満'
			when 35.0 <= _bmi && _bmi < 40.0
				'高度肥満'
			when 40.0 <= _bmi
				'高度肥満'
		end
	end
end
