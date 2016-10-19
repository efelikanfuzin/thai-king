class QuestionsController < ApplicationController
  # GET /questions
  def index
    @questions = Question.includes(:answers).all
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:text, :answer_id)
  end
end
