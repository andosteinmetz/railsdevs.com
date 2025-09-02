class SavedDevelopersController < ApplicationController
  before_action :authenticate_user!

  def create
    developer = Developer.find(params[:developer_id])
    current_user.saved_developers.create!(developer: developer)
    redirect_back fallback_location: developers_path, notice: "Developer saved"
  end

  def destroy
    developer = Developer.find(params[:developer_id])
    current_user.saved_developers.find_by!(developer: developer).destroy
    redirect_back fallback_location: developers_path, notice: "Developer unsaved"
  end

  def index
    @saved_developers = current_user.saved_developer_profiles
  end
end
