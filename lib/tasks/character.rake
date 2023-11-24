namespace :character do
  desc "Generate a new description for a character based on their photo"
  task generate_description: :environment do
    UpdateCharacterDescriptionJob.perform_later(ENV['CHARACTER_ID'])
  end
end
