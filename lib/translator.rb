# require modules here
require "yaml"
require 'pry'


#emoticons = YAML.load_file('emoticons.yml')

def load_library(directory)

  emoticons = YAML.load_file(directory)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  emoticons.each do |word, emotes|

    new_hash["get_meaning"][emotes[1]] = word
    new_hash["get_emoticon"][emotes[0]] = emotes[1]
  end
  new_hash
end

def get_japanese_emoticon(directory, eng_emoticon)
  # code goes here
  emoticon_hash = load_library(directory)
  emoticon_hash["get_emoticon"].each do |get, emotes|

    if get == eng_emoticon
      return emotes
    end
  end
  return "Sorry, that emoticon was not found"

end

def get_english_meaning(directory, jp_emoticon)
  # code goes here
  emoticon_hash = load_library(directory)
  emoticon_hash["get_meaning"].each do |get, meaning|
    if get == jp_emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
