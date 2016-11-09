if @settings
  json.call @settings, :balance_after_reset, :initial_balance
end