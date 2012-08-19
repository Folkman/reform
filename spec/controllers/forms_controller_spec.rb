require 'spec_helper'

describe FormsController do
  describe 'GET #index' do
    it 'should be successful' do
      get :index
      response.should be_success
    end
  end

  describe 'GET #new' do
    it 'should be successful' do
      get :new
      response.should be_success
    end
  end

  describe 'GET #show' do
    it 'should be successful' do
      form = create(:form)
      get :show, id: form.id
      response.should be_success
    end
  end

  describe 'GET #edit' do
    it 'should be successful' do
      form = create(:form)
      get :edit, id: form.id
      response.should be_success
    end
  end

  describe 'POST #create' do
    it 'should create the form' do
      form = attributes_for(:form)
      expect{post :create, form: form}.to change{Form.count}.by(1)
    end
  end

  describe 'PUT #update' do
    it 'should update the form' do
      form = create(:form, name: 'Name')
      post :update, id: form.id, form: { name: 'Hello' }
      form.reload
      form.name.should == 'Hello'
    end
  end

  describe 'PUT #destroy' do
    it 'should delete the form' do
      form = create(:form)
      expect{put :destroy, id: form.id}.to change{Form.count}.by(-1)
    end
  end
end
