require 'open-uri'

class Character < ApplicationRecord
  after_commit :generate_description, on: :create

  has_one_attached :photo
  has_many_attached :illustrations

  def generate_description
    UpdateCharacterDescriptionJob.perform_later(id)
  end

  def attach_illustration_from_url(url)
    illustrations.attach(io: URI.open(url), filename: "heroifyme_#{SecureRandom.hex(8)}.png")
  end
end
