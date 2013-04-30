class UsersController < ApplicationController
  # before_filter :get_users_for_page, only: :show

  def index
    if params[:page]
      @users = User.by_karma.page(params[:page].to_i)
      @page = params[:page].to_i
    else
      @page = 1
      @users = User.by_karma.limit(50)
    end
  end

  # private

  # def get_users_for_page
  #   @users = User.by_karma.page(params[:id].to_i)
  # end
end
