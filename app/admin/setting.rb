ActiveAdmin.register Setting do
  permit_params :initial_balance, :balance_after_reset
end
