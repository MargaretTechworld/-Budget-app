module ApplicationHelper
  def format_amount(amount)
    formatted_amount = format('%.2f', amount)
    parts = formatted_amount.split('.')
    parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, '\1,')
    parts.join('.')
  end
end
