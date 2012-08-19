class QuestionsController < ApplicationController

  def new
    @number_of_questions = params[:number_of_questions].to_i
  end

  def create
    form = Form.find params[:form_id]
    1.upto(params[:number_of_questions].to_i) do |i|
      form.questions << Question.new(params["question_#{i}".to_sym])
    end
    if form.save
      redirect_to forms_path
    else
      render :new
    end
  end

  def edit
    form = Form.find params[:form_id]
    @number_of_questions = params[:number_of_questions].to_i unless params[:number_of_questions].to_i == 0
    @number_of_questions ||= form.questions.size
    1.upto(@number_of_questions) do |i|
      q = form.questions.where('arrangement = ?', i)
      q = q.first
      unless q.blank?
        instance_variable_set("@value#{i}", q.value)
        instance_variable_set("@format#{i}", q.format)
        instance_variable_set("@arrangement#{i}", q.arrangement)
      end
    end
  end

  def update
    form = Form.find params[:form_id]
    number_of_questions = params[:number_of_questions].to_i unless params[:number_of_questions].to_i == 0
    number_of_questions ||= form.questions.size
    1.upto(number_of_questions) do |i|
      q = form.questions.where('arrangement = ?', i)
      q = q.first
      unless q.blank?
        q.value = params["question_#{i}".to_sym][:value]
        q.format = params["question_#{i}".to_sym][:format]
        q.arrangement = params["question_#{i}".to_sym][:arrangement]
        form.questions << q
      else
        form.questions << Question.new(params["question_#{i}".to_sym])
      end
    end
    if form.save
      redirect_to form_path(form)
    else
      render :new
    end
  end
end
