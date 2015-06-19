class Menu < ActiveRecord::Base
  def display_stocks
    case true
      when stocks < 1
        '品切れ'
      when 1 <= stocks && stocks < 500
        '残りわずか'
      when 500 <= stocks
        "あと#{stocks}個"
    end
  end

  def display_price
    "¥#{price.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse}-"
  end

  def image_css_class
    "img_#{id}"
  end
end
