# require modules here

require "yaml" 

def load_library(file)
  yaml = YAML.load_file(file)
  result = {}
  result["get_meaning"] = {}
  result["get_emoticon"] = {}
    yaml.each do |meaning, emote|
      result["get_meaning"][emote[1]] = meaning 
      result["get_emoticon"][emote[0]] = emote[1]
    end 
    result 
end

def get_japanese_emoticon(file, emoticon)
  result = load_library(file)
  result["get_emoticon"].each do |key, emote|
    if key == emoticon
      return emote  
    end 
  end 
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  result = load_library(file)
  result["get_meaning"].each do |key, meaning|
    if key == emoticon 
      return meaning 
    end 
  end 
  "Sorry, that emoticon was not found"
end
