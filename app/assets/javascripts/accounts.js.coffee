# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
Stripe.setPublishableKey $('meta[name=stripe-key]').attr 'content'

$(".accounts#card form").submit (event) ->
  # disable the submit button to prevent repeated clicks
  $(".accounts#card .form-actions [type='submit']").attr "disabled", "disabled"

  Stripe.createToken
    number: $(".accounts#card #account_card_number").val()
    cvc: $(".accounts#card #account_card_cvc").val()
    exp_month: $(".accounts#card select.date").last().val()
    exp_year: $(".accounts#card select.date").first().val()
  , (status, response) ->
    if status == 200
      url = $(".accounts#card .form-controls #account_path").val()
      data = {"account": { "stripe_token": "#{response.id}" } }
      $.ajax(
        type: 'PUT'
        url: url + '.json'
        data: data
        dataType: 'json'
      ).always ->
        window.location = url + '/card'
    else
      error_message = response.error.message
      error_html = "<div class='alert alert-error'>#{error_message}</div>"
      $(".accounts#card .form-errors").html error_html
    $(".accounts#card .form-actions [type='submit']").attr "disabled", null
  false
