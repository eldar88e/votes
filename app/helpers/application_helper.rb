module ApplicationHelper
  def prepend_flash
    turbo_stream.update 'flash', partial: 'shared/flash'
  end
end
