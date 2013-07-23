class SiteController < ApplicationController
  # sets the only to access the index, the user needs to be authenticated
  before_action :is_authenticated, only: [:index]

  def index
  end

  def privacy
  end

  def terms
  end
end
