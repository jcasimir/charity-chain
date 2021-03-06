class App.Controller.Wallets extends Spine.Controller
  constructor: ->
    super
    @events()

  events: ->
    App.Goal.bind('goal-selected', @render)

  render: =>
    @wallet_amount = goal.wallet_amount.split(".")[0]
    @reserve_amount = goal.reserve_amount.split(".")[0]
    @sponsors_count = goal.sponsors.length
    @donation_total = goal.donation_total.split(".")[0]
    $("#wallet").html @view('wallet')(@)
    $('a.addthis').attr('addthis:url', goal.contribute_url)
    $('a.addthis').attr('addthis:title', "Support my streak for DonorsChoose!")
    $('.social-container').html($('.addthis-buttons').html())
    if goal.reserve_amount == "0.00"
      $('.reserve-amount').popover({placement:'top'})
