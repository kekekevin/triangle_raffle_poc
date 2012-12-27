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
    $('#purchase').button()
    $('#electronic_raffle_order_basic_order_detail_attributes_quantity').change ->
      order.calculateTotal($(this).val())
    $('#new_electronic_raffle_order').submit ->
      $('#purchase').button('loading')
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
    $('.alert').remove()
    if status == 200
      $('#electronic_raffle_order_stripe_token').val(response.id)
      $('#electronic_raffle_order_card_type').val(response.card.type)
      $('#electronic_raffle_order_card_last_4_digits').val(response.card.last4)
      $('#new_electronic_raffle_order')[0].submit()
    else
      $('#new_electronic_raffle_order legend')
        .after($("<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>×</button><strong>Warning</strong> There is an issue with the credit card that has been provided. </div>"))
      $('.alert.alert-error').append(response.error.message)
      $('html, body').animate(
        { scrollTop: $(".alert.alert-error").offset().top },
        500)        
      $('#card_number').closest('.control-group').addClass('error')
      $('#card_code').closest('.control-group').addClass('error')
      $('#card_month').closest('.control-group').addClass('error')
      $('#card_year').closest('.control-group').addClass('error')
      $('#purchase').button('reset')
