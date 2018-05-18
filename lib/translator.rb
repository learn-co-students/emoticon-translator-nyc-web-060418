require 'yaml'

def load_library(file_path)
  emoticons_raw = YAML.load_file(file_path)
  translation_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons_raw.each_pair do |meaning, emot_array|
    translation_hash['get_meaning'][emot_array[1]] = meaning
    translation_hash['get_emoticon'][emot_array[0]] = emot_array[1]
  end
  translation_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  translation_hash = load_library(file_path)
  translation_hash['get_emoticon'][english_emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  translation_hash = load_library(file_path)
  translation_hash['get_meaning'][japanese_emoticon] || "Sorry, that emoticon was not found"
end
