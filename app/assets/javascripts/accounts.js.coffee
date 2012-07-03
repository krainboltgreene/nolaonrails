# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
Stripe.setPublishableKey $('meta[name=stripe-key]').attr 'content'

$(".accounts#payment form").submit (event) ->
  # disable the submit button to prevent repeated clicks
  $(".accounts#payment .form-actions [type='submit']").attr "disabled", "disabled"

  Stripe.createToken
    number: $(".accounts#payment #account_card_number").val()
    cvc: $(".accounts#payment #account_card_cvc").val()
    exp_month: $(".accounts#payment select.date").last().val()
    exp_year: $(".accounts#payment select.date").first().val()
  , (status, response) ->
    if status == 200
      url = $(".accounts#payment .form-controls #account_path").val()
      data = {"account": { "stripe_token": "#{response.id}" } }
      $.ajax(
        type: 'PUT'
        url: url + '.json'
        data: data
        dataType: 'json'
      ).always ->
        window.location = url + '/payment'
    else
      error_message = response.error.message
      error_html = "<div class='alert alert-error'>#{error_message}</div>"
      $(".accounts#payment .form-errors").html error_html
    $(".accounts#payment .form-actions [type='submit']").attr "disabled", null
  false
