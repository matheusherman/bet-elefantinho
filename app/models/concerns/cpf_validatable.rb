# frozen_string_literal: true

module CpfValidatable
  extend ActiveSupport::Concern

  included do
    validate :cpf_must_be_valid, if: -> { cpf.present? }
    before_validation :strip_cpf_mask
  end

  private

  def strip_cpf_mask
    self.cpf = cpf.to_s.gsub(/\D/, '') if cpf.present?
  end

  def cpf_must_be_valid
    return if cpf.blank?

    unless valid_cpf?(cpf)
      errors.add(:cpf, 'é inválido')
    end
  end

  def valid_cpf?(cpf_string)
    # Remove caracteres não numéricos
    cpf_digits = cpf_string.gsub(/\D/, '')

    # Verifica se tem 11 dígitos
    return false unless cpf_digits.length == 11

    # Verifica CPFs conhecidos inválidos (todos dígitos iguais)
    return false if cpf_digits.match?(/\A(\d)\1{10}\z/)

    # Calcula primeiro dígito verificador
    sum = 0
    9.times { |i| sum += cpf_digits[i].to_i * (10 - i) }
    first_digit = 11 - (sum % 11)
    first_digit = 0 if first_digit >= 10

    return false unless first_digit == cpf_digits[9].to_i

    # Calcula segundo dígito verificador
    sum = 0
    10.times { |i| sum += cpf_digits[i].to_i * (11 - i) }
    second_digit = 11 - (sum % 11)
    second_digit = 0 if second_digit >= 10

    second_digit == cpf_digits[10].to_i
  end
end