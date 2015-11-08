class UrlsController < ApplicationController
  def show
    render json: Url.find(params[:id])
  end

  def create
    new_url = Url.new(url_params)
    if new_url.save  
      render json: new_url
    end
  end

  private
  def url_params
    params.require(:url).permit(:link)
  end
end
