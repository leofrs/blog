class ArticlesController < ApplicationController
  before_action :require_login, except: [:index, :show, :edit, :update, :destroy, :filter_by_tag]

  def index
    @article = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
    @tags = Tag.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

  if @article.save

    tag_list = params[:article][:tag_list]
    tags_array = tag_list.split(/,\s*/)
    tags_array.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      @article.tags << tag
    end

    redirect_to @article
  else
    render :new, status: :unprocessable_entity
  end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      # Processar a lista de tags
      tag_list = params[:article][:tag_list]
      tags_array = tag_list.split(/,\s*/) # Divide a string por vírgulas, removendo espaços em branco adicionais

      # Limpar as tags antigas do artigo
      @article.tags.clear

      # Iterar sobre as tags atualizadas e associá-las ao artigo
      tags_array.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        @article.tags << tag
      end

      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  def filter_by_tag
    def filter_by_tag
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts
      render 'index'
    end
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :tag_list)
    end
end
