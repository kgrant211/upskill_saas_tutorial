/* global $, Stripe */
//Document ready
$(document).on('turbolinks:load', function(){
    var theForm = $('#pro_form');
    var submitBtn = $('#form-submit-btn')
    //Set Stripe public key
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
    //When user clicks form submit button
    //prevent default submission behavior
    
    //Collect CC fields
    //Send card information to Stripe
    //Stripe will return a card token
    //Inject card token as hidden field into form
    //Submit form into our rails app
});