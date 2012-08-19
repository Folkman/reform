class AnswersController < ApplicationController

  def answer
    @form = Form.find params[:form_id]
    @questions = @form.questions
    number_of_questions = @questions.size
  end

  def submit
    form = Form.find params[:form_id]
    questions = form.questions
    saved = false

    questions.each do |q|
      q.answers << Answer.new(value: params[:form]["answer_#{q.id}".to_sym][:value], username: params[:username])
      saved = q.save
    end

    if saved
      redirect_to form_answers_for_user_path(form, params[:username])
    else
      render :answer
    end
  end

  def show
    @form = Form.find params[:form_id]
    @number_of_questions = 0
    @form.questions.each do |q|
      @number_of_questions += 1
      instance_variable_set("@question_#{@number_of_questions}", q)
      instance_variable_set("@answer_#{@number_of_questions}", q.answers.where('username = ?', params[:username]).first)
    end
  end
end
