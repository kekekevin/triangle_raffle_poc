jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  order.calculateTotal($('#electronic_raffle_order_basic_order_detail_attributes_quantity').val())
  order.setupForm()
  
order = 
  calculateTotal: (quantity) ->
    if quantity
      $('#total').val(quantity * 50)
    else
      $('#total').val(0)
  setupForm: ->
    $('#electronic_raffle_order_basic_order_detail_attributes_quantity').change ->
      order.calculateTotal($(this).val())
    $('#new_electronic_raffle_order').submit ->
      $('#purchase').prop('disabled', true)
      if $('#card_number').length
        order.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number:   $('#card_number').val()
      cvc:      $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear:  $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)
    
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#electronic_raffle_order_stripe_token').val(response.id)
      $('#electronic_raffle_order_card_type').val(response.card.type)
      $('#electronic_raffle_order_card_last_4_digits').val(response.card.last4)
      $('#new_electronic_raffle_order')[0].submit()
    else
      alert(response.error.message)
      
