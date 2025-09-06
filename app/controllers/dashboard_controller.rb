class DashboardController < ApplicationController
  def index
    @productions = Production.all
  end
end
