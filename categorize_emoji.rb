#!/usr/bin/env ruby

require 'fileutils'

require_relative 'activity.rb'
require_relative 'animal_and_nature.rb'
require_relative 'flags.rb'
require_relative 'food_and_drink.rb'
require_relative 'objects.rb'
require_relative 'smile_and_people.rb'
require_relative 'symbols.rb'
require_relative 'travel_and_places.rb'

emojis = [
{name: 'activity', emojis: get_activity_files},
{name: 'animal_and_nature', emojis: get_animal_and_nature_files},
{name: 'flags', emojis: get_flags_files},
{name: 'food_and_drink', emojis: get_food_and_drink_files},
{name: 'objects', emojis: get_objects_files},
{name: 'smile_and_people', emojis: get_smile_and_people_files},
{name: 'symbols', emojis: get_symbols_files},
{name: 'travel_and_places', emojis: get_travel_and_places_files}]

current_folder = "all_emojix"
new_folder = "categorize_emojix"

def travel_reference

  Dir['reference_emoji/**/*'].reject {|fn| File.directory?(fn) }.each do |file|
    folders_and_file = file.split('/', 4)
    category = folders_and_file[1]
    sub_category = folders_and_file[2]
    file = folders_and_file[3]
  end

end

def move_files_to_category(current_folder, new_folder, category, emoji_name)
  filename = emoji_name.tr(':,!().&','').gsub(/\s+/, "-") + ".png"
  current_location = current_folder + "/" + filename
  new_location = new_folder + "/" + category + "/" + filename

  begin
    FileUtils.mv( current_location , new_location)
  rescue Errno::ENOENT => e
    puts e.message
  end
end

travel_reference

# emojis.each do |category|
#   FileUtils.mkdir_p new_folder
#   FileUtils.mkdir_p "#{new_folder}/#{category[:name]}"

#   category[:emojis].each do |emoji|
#     move_files_to_category(current_folder, new_folder, category[:name], emoji)
#   end
# end