class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(status: 'paid')
    # updating stock
    order.order_products.each do |order_product|
      product = order_product.product
      product.update(available: false)
    end
  end
end
