class MainController < ApplicationController
   def index
      @posts = Post.all
      @friends = Friend.all
    end
  end