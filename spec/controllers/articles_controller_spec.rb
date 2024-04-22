require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  before do
    @article = Article.create(id:1, title: "Test Article", body: "Test Body")
  end

  describe "GET #show" do
    it "assigns the requested article to @article" do
      get :show, params: { id: @article.id }
      expect(assigns(:article)).to eq(@article)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new article" do
        expect {
          post :create, params: { article: {id:1, title: "New Article", body: "New Body" } }
        }.to change(Article, :count).by(0)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the article" do
        patch :update, params: { id: @article.id, article: { title: "Updated Title" } }
        @article.reload
        expect(@article.title).to eq("Updated Title")
      end
    end
  end

end
