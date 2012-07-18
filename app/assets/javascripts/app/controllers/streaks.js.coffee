class App.Controller.Streaks extends Spine.Controller

  constructor: ->
    super
    # @render()
    @events()

  events: ->
    $("#check-in-button").live('click', @checkIn)
    App.CheckIn.bind('create', @updateStreak)
    App.Goal.bind('goal-selected', @render)

  render: =>
    if goal.streaks
      @current_streak = goal.streaks[0]
      @longest_streak = _.max(goal.streaks)
      @average_streak = Math.round (@sum(goal.streaks) / goal.streaks.length)
    else
      @current_streak = @longest_streak = @average_streak = 0

    $("#streak").html @view('streak')(@)

  sum: (streaks) =>
    total = 0
    $.each streaks, -> total += this
    total

  checkIn: =>
    check_in = new App.CheckIn({goal_id: goal.id})
    check_in.save()

  updateStreak: (btn) ->
    $("#streak-length").fadeOut(200, -> $(this).html("21")).fadeIn(200);
    $("#dollars-earned").fadeOut(200, -> $(this).html("91")).fadeIn(200);
    $("#longest-streak-length").html("21");
    $("#check-in-button").addClass('disabled-button').attr('disabled', true);