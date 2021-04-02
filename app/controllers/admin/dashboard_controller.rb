class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV[ADMIN_USERNAME], password: ENV[ADMIN_PASSWORD]
  def show
    @product_amount= Product.count 
    @category_amount=Category.count
   
  end
end
