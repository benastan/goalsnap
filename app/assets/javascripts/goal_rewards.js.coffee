# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

GoalRewardLogic = []

GoalRewardLogic.push ->
  $new_goal_reward = $ '#new_goal_reward'
  return unless $new_goal_reward.length > 0
  $new_reward_link = $ '#new_reward_link'
  $new_goal_link = $ '#new_goal_link'
  $('#new_reward_container, #new_goal_container').each (index, container) ->
    is_reward = if index is 1 then true else false
    modelClass = if is_reward then Goalsnap.Models.Reward else Goalsnap.Models.Goal
    $container = $ container
    $toggle_link = $container.parent().find 'a'
    $select = $container.parent().find 'select'
    $title = $container.find 'input[type=text]'
    $description = $container.find 'textarea'
    $button = $container.find 'input[type=submit]'
    $error = $container.find '.error'
    container_is_showing = false
    $toggle_link.click ->
      $select[if container_is_showing then 'show' else 'hide']()
      $container[if container_is_showing then 'hide' else 'show']()
      container_is_showing = !container_is_showing
    $button.click ->
      unless $title.val() && $description.val()
        $error.show()
        return false
      model = new modelClass
      attr =
        title: $title.val()
        description: $description.val()
      model.save attr,
        complete: ->
          $option = $ document.createElement 'option'
          $option.html model.get('title')
          $option.val model.id
          $select.append $option
          $option.attr 'selected', 'selected'
          $toggle_link.trigger 'click'
          $title.val ''
          $description.val ''
      return false

  $new_reward_link.click ->

_.each GoalRewardLogic, (logic) -> logic() if typeof logic is 'function'
