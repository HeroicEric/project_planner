import Ember from 'ember';

var get = Ember.get;

export default Ember.Route.extend({
  model: function() {
    return this.store.find('project');
  },

  redirect: function(projects) {
    this.transitionTo('projects.show', get(projects, 'firstObject'));
  }
});
