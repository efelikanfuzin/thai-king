ActiveAdmin.register User do
  permit_params :balance, :passed_questions, :device_id, :token, :email
end
