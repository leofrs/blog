# app/controllers/uploads_controller.rb
class UploadsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    file = params[:file]
    title = params[:title]

    if file.present? && title.present?
      file_path = file.tempfile.path

      article = Article.new(title: title, body: File.read(file_path))
      article.user = current_user

      if article.save
        redirect_to article, notice: "O arquivo foi postado com sucesso."
      else
        redirect_to new_upload_path, alert: "Não foi possível postar o arquivo."
      end
    else
      redirect_to new_upload_path, alert: "Por favor, selecione um arquivo e insira um título para fazer upload."
    end
  end

end
