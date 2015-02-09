import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return this.store.createRecord('project');
  },

  actions: {
    save: function(project) {
      var _this = this;

      project.save().then(function(project) {
        _this.transitionTo('projects.show', project);
      }, function() {
      });
    }
  }
});
