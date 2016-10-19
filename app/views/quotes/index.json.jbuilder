json.last_update @last_update

json.quotes @quotes do |quote|
  json.extract! quote, :id, :text, :author, :url
end
