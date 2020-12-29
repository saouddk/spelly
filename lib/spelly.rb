# frozen_string_literal: true

require 'hunspell-ffi'

class Spelly
  attr_accessor :dict

  def initialize(language)
    path = File.expand_path('../lib/dict', File.dirname(__FILE__))
    # path = "#{Gem.loaded_specs['spelly'].full_gem_path}/lib/dict"
    @dict = Hunspell.new("#{path}/#{language}.aff", "#{path}/#{language}.dic")
  end

  def spell_check(words)
    results = []
    words.each do |word|
      results << { word: word, spell_check: @dict.spell(word) }
    end
    results
  end
end
