class User < ApplicationRecord

  has_many :owner
  has_many :post
  has_many :message

  validates :first_name, :last_name,
    :email_address, presence: {message: "Este campo es requerido"}

end

