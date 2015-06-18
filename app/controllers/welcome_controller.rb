class WelcomeController < ApplicationController
  skip_before_action :authenticate_user! # SKIPPING LOGIN FOR SOME PAGES

  def index
  end

end
