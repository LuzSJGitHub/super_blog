class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :author, :message,
     presence: {message: "Este campo es requerido"}

end
