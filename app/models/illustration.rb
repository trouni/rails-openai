require 'open-uri'

class Illustration < ApplicationRecord
  belongs_to :user

  has_one_attached :character_photo
  has_many_attached :images

  validates :situation, presence: true
  validates :character_photo, presence: true
end
