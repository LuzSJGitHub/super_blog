class Post < ApplicationRecord
  has_many :message
  
  belongs_to :blog
  belongs_to :user

  validates :title,
    :content, presence: {message: "Este campo es requerido"}

end

