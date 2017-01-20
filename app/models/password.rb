class Password < ApplicationRecord
  validate :at_least_three_words, :no_whitespace

  private

  def no_whitespace
    error_count = 0
    user_inputs.each { |s|  error_count += 1 if s.chomp.match(/\s/) != nil }
    errors.add(:user_inputs, 'whitespace characters are not allowed') if error_count > 0
  end

  def at_least_three_words
    errors.add(:user_inputs, 'at least 3 words required') if user_inputs.length < 3
  end
end
