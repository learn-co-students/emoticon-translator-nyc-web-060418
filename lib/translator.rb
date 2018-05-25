# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emo = YAML.load_file(file_path)
  
  hash = { "get_meaning" => {}, "get_emoticon" => {} }
  
  emo.each do |meaning, sym_arr| # array of eng, jap
    hash["get_meaning"].merge!( { sym_arr[1] => meaning} )
    hash["get_emoticon"].merge!( {sym_arr[0] => sym_arr[1] } )
  end
  
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  
  hash.values[1].each do |english, japanese|
    return japanese if english == emoticon
  end
  
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  
  hash.values[0].each do |japanese, meaning|
    return meaning if japanese == emoticon
  end
  
  return "Sorry, that emoticon was not found"
end