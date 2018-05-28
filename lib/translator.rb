require "yaml"

def load_library(file_path)
  emoticon_dictionary = YAML.load_file(file_path)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  emoticon_dictionary.each do |english, symbol_array|
    new_hash["get_meaning"][symbol_array[1]] = english
  end
  emoticon_dictionary.each do |english, symbol_array|
    new_hash["get_emoticon"][symbol_array[0]] = symbol_array[1]
  end
  return new_hash
end

# When given an english emoji, returns its Japanese emoji equivalent.
def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
  lib = lib["get_emoticon"]
  lib.each do |english_emoji, japanese_emoji|
    if emoticon == english_emoji
      return japanese_emoji
    end
  end
  return "Sorry, that emoticon was not found"
end

# When given a Japanese emoji, returns its English meaning.
def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)
  lib = lib["get_meaning"]
  lib.each do |japanese_emoji, english_meaning|
    if emoticon == japanese_emoji
      return english_meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
