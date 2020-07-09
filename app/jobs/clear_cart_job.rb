class ClearCartJob < ApplicationJob
  queue_as :default

  def perform
    Cart.all.each { |cart| cart.order_products.where('created_at < ?', 10.seconds.ago).each(&:destroy) }
  end
end
