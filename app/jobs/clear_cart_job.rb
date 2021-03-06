class ClearCartJob < ApplicationJob
  queue_as :default

  def perform
    Cart.all.each { |cart| cart.order_products.where('created_at < ?', 10.minutes.ago).each(&:destroy) }
  end
end
