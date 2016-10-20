json.last_update @last_update

json.questions @questions do |question|
  json.(question, :id, :text)
  json.right_answer question.right_answer, :id
  json.answers question.answers, :id, :text, :is_right
end
