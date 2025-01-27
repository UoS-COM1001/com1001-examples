# Provide various functions for validating data
module Validation
  def str_email_address?(str)
    return false if str.nil?

    str.match?(/\A\S+@\S+\Z/)
  end

  def str_digits?(str)
    return false if str.nil?

    str.match?(/^(\d)+$/)
  end

  def str_length?(str, len)
    return false if str.nil?

    str.length == len
  end

  def str_min_length?(str, min_len)
    return false if str.nil?

    str.length >= min_len
  end

  def str_max_length?(str, max_len)
    return false if str.nil?

    str.length <= max_len
  end

  def str_uk_telephone?(str)
    return false if str.nil?

    str = str.delete(" ").delete("-")
    str.start_with?(str, "0") && str_min_length?(str, 10) && str_max_length?(str, 11)
  end

  def str_yyyy_mm_dd_date?(str)
    return false if str.nil?

    y, m, d = str.split("-")

    return Date.valid_date?(y.to_i, m.to_i, d.to_i) if str_length?(y, 4)

    false
  end
end
