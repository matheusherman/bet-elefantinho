module ApplicationHelper
<<<<<<< HEAD
=======
    def format_cpf(cpf)
    return '' if cpf.blank?
    
    # Remove caracteres não numéricos
    digits = cpf.to_s.gsub(/\D/, '')
    
    return cpf if digits.length != 11
    
    # Formata como 123.456.789-01
    "#{digits[0..2]}.#{digits[3..5]}.#{digits[6..8]}-#{digits[9..10]}"
  end
>>>>>>> 544aca5b57da0a438451da017d22ccc0c7e30485
end
