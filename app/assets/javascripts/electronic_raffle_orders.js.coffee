jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  order.setupForm()
  
order = 
  setupForm: ->
    $('#new_electronic_raffle_order').submit ->
      $('#purchase').prop('disabled', true)
      order.processCard()
      false
  
  processCard: ->
    card =
      number:   $('#card_number').val()
      cvc:      $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear:  $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)
    
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_electronic_raffle_order')[0].submit()
    else
      alert(response.error.message)
      
