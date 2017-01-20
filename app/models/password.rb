class Password < ApplicationRecord
  before_validation :delete_empty_words
  validate :at_least_three_words, :no_whitespace
  before_create :generate_combinations

  private

  def no_whitespace
    if user_inputs.any? { |w| w.strip.include?(' ') }
      errors.add(:user_inputs, 'whitespace characters are not allowed')
    end
  end

  def at_least_three_words
    errors.add(:user_inputs, 'at least 3 words required') if user_inputs.length < 3
  end

  def delete_empty_words
    self.user_inputs.delete_if(&:blank?)
  end

  def generate_combinations
    self.combinations = GenerateCombinations.new(user_inputs).call
  end
end
