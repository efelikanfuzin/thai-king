json.questions @questions do |question|
  json.(question, :text)
  json.right_answer_id question.right_answer.id
  json.answers question.answers, :id, :text
end
