module ApplicationHelper
  def icon_cart
    b3_icon 'glyphicon-shopping-cart'
  end
  def icon_pencil
    b3_icon 'glyphicon-pencil'
  end
  def icon_info
    b3_icon 'glyphicon-info-sign'
  end
  def icon_list
    b3_icon 'glyphicon-list'
  end
  def icon_list2
    b3_icon 'glyphicon-list-alt'
  end
  def icon_left
    b3_icon  'glyphicon-arrow-left'
  end
  def icon_left2
    b3_icon  'glyphicon-chevron-left'
  end
  def icon_delete
    b3_icon 'glyphicon-remove-sign'
  end
  def b3_icon(icon_class)
    sanitize "<i class='glyphicon #{icon_class}'></i>"
  end
end
