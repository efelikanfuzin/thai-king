class QuestionsController < ApplicationController
  before_action :require_auth, only: :index

  # GET /questions
  def index
    render head(:unauthorized) && return unless @current_user

    @question_update = Update.where(model: :question).first
    if params[:all]
      @questions = Question.includes(:answers).approved
      return
    end
    @questions = if @question_update.last?(params[:last_update])
                   []
                 else
                   Question.includes(:answers).approved
                           .where.not(id: @current_user.try(:passed_questions))
                 end
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
