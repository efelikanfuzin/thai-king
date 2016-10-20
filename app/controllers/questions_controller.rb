class QuestionsController < ApplicationController
  # GET /questions
  def index
    @questions = Question.includes(:answers).approved.all
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    unless @question.save
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:text, answers_attributes:
                                              [:text, :is_right])
  end
end
