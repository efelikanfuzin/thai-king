class Update < ApplicationRecord
  def last?(last_update)
    self.last_update == last_update.to_i
  end
end
