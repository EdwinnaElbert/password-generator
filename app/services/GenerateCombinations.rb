class GenerateCombinations
  attr_reader :words
  def initialize(words)
    @words = words
  end

  def call
    return nil if words.empty?
    words.map{|w| w.strip }.permutation.to_a.map(&:join).flatten
    end
end
