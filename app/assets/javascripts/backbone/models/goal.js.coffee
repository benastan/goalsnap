class Goalsnap.Models.Goal extends Backbone.Model
  paramRoot: 'goal'
  urlRoot: '/goals'

class Goalsnap.Collections.GoalsCollection extends Backbone.Collection
  model: Goalsnap.Models.Goal
  url: '/goals'
