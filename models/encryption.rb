require 'bcrypt'

class Encryption

  attr_reader :encrypted

  def initialize(password)
    @encrypted = BCrypt::Password.create(password)
  end

end
