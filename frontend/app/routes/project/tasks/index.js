import Ember from 'ember';

var get = Ember.get;

export default Ember.Route.extend({
  model: function() {
    var project = this.modelFor('project');

    return get(project, 'tasks');
  }
});
