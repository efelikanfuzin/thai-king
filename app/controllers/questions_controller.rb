class QuestionsController < ApplicationController
  before_action :require_auth, only: :index

  # GET /questions
  def index
    unless @current_user
      render head(:unauthorized) && return
    end
    @questions = Question.includes(:answers).approved
                         .where.not(id: @current_user.passed_questions)
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
