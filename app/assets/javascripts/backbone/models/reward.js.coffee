class Goalsnap.Models.Reward extends Backbone.Model
  paramRoot: 'reward'
  urlRoot: '/rewards'

class Goalsnap.Collections.RewardsCollection extends Backbone.Collection
  model: Goalsnap.Models.Reward
  url: '/rewards'
