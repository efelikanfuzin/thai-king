class Answer < ApplicationRecord
  belongs_to :question

  after_save :last_updates

  private

  def last_updates
    update = Update.where(model: :question).first
    update.update_attributes(last_update: Time.new.to_i)
  end
end
