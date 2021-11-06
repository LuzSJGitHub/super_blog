class Blog < ApplicationRecord

  has_many :post
  has_many :owner

  validates :name, :description,
     presence: {message: "Este campo es requerido"}
  
end

