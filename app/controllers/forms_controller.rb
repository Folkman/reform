class FormsController < ApplicationController

  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
  end

  def show
    @form = Form.find params[:id]
  end

  def edit
    @form = Form.find params[:id]
    @form.number_of_questions = @form.questions.size unless @form.questions.blank?
  end

  def create
    form = Form.new params[:form]
    if form.save
      redirect_to new_form_question_path(form, number_of_questions: params[:form][:number_of_questions])
    else
      render :new
    end
  end

  def update
    form = Form.find params[:id]
    if form.update_attributes(params[:form])
      redirect_to edit_form_questions_path(form, number_of_questions: params[:form][:number_of_questions])
    else
      render :edit
    end
  end

  def destroy
    form = Form.find params[:id]
    form.destroy
    redirect_to forms_path
  end
end
