require 'will_paginate/array'
class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
    authorize! :show, @users
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, @user
    @papers = @user.papers.last(5).reverse # show first 5, from newest to oldest
    authorize! :show, @papers
  end

  def new
  end
end
