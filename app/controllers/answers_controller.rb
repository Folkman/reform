class AnswersController < ApplicationController

  def login
    @form = Form.find params[:form_id]
  end

  def check_username
    @form = Form.find params[:form_id]
    questions = @form.questions
    usernames = Array.new

    questions.each do |q|
      usernames << q.answers.where('username = ?', params[:username]).first.try(:username)
    end

    if params[:username].blank?
      flash.now[:error] = "Username can't be blank"
      render :login
    elsif usernames.include?(params[:username])
      flash.now[:error] = 'Username already exists'
      render :login
    else
      redirect_to answer_form_questions_path(@form, username: params[:username])
    end
  end

  def answer
    @form = Form.find params[:form_id]
    @questions = @form.questions
    number_of_questions = @questions.size
  end

  def submit
    form = Form.find params[:form_id]
    questions = form.questions
    username = nil
    saved = false

    questions.each do |q|
      q.answers << Answer.new(params[:form]["answer_#{q.id}".to_sym])
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

  def destroy
    form = Form.find params[:form_id]
    questions = form.questions
    answers = []

    questions.each do |q|
      answers = q.answers.where('username = ?', params[:username]).pluck(:id)
    end
    Answer.destroy(answers)
    redirect_to form_path(form)
  end
end
