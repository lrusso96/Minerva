require 'will_paginate/array'
class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @papers = @user.papers.last(5).reverse # show first 5, from newest to oldest
    @followers = @user.followers(User).last(5).reverse
    @followees = @user.followees(User).last(5).reverse
  end

  def new; end
end
