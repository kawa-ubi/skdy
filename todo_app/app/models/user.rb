require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :todos
  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      self.password = Digest::SHA1.hexdigest(self.password)
    else
      self.password = self.password_was
    end
  end

  def registered?
    # ここを考えて下さい。
    # email/passwordで認証できれば true を
    # 認証できなければ falseを戻します。
    # さらに、認証できた場合は
    # インスタンスのidに認証されたユーザーのidが入るようにします

    user = User.find_by(email: self.email, password: self.encrypt_password)
    if user
      self.id = user.id
      return true
    else
      return false
    end
  end
end
