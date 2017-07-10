class Api::ThemesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render( status: 200, json: {themes: Theme.all}.to_json )
  end

  def show
    render( status: 200, json: {theme: Theme.find(params[:id])}.to_json )
  end

  def create
    theme = Theme.new(theme_params)
    if theme.save
      render(status: 201, json: {message: "Theme created!", theme: theme}.to_json)
    else
      render(status: 422, json: {errors: theme.errors}.to_json)
    end
  end

  def update
    theme = Theme.find(params[:id])
    if theme.update(theme_params)
      render(status: 200, json: {message: "Theme updated!"}.to_json)
    else
      render(status: 422, json: {errors: theme.errors}.to_json)
    end
  end

  def destroy
    Theme.find(params[:id]).destroy
    render(status: 200, json: {message: "Theme deleted!"}.to_json)
  end

  private

  def theme_params
    params.require(:theme).permit(:name)
  end
end
