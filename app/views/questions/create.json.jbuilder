json.question do
  json.(@question, :id, :text)
  json.answers @question.answers, :id, :text, :is_right
end
