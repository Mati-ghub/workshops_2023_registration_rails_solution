require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    context "for no task attributes given" do
      it 'renders new template' do
        post :create, params: { task: { foo: 'bar' } }
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end

    context "for task attributes given" do
      it 'renders new template' do
        post :create, params: { task: { title: 'foo', description: 'bar', dedline: Date.new(2023, 10, 1 ) } }
        expect(response).to redirect_to tasks_url
        expect(flash[:notice]).to be_present
      end
    end
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end
end
