class Quote < ApplicationRecord
  after_save :last_updates

  private

  def last_updates
    update = Update.where(model: :quote).first
    update.update_attributes(last_update: Time.new.to_i)
  end
end
