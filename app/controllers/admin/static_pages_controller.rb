class Admin::StaticPagesController < ApplicationController
  def home
    @admin = true;
  end

  def help
  end
end
