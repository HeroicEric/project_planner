import Ember from 'ember';

var get = Ember.get;

export default Ember.Route.extend({
  model: function() {
    return this.modelFor('project');
  },

  actions: {
    save: function(project) {
      var _this = this;

      project.save().then(function(project) {
        _this.transitionTo('project', project);
        _this.notify.success('Project saved successfully!');
      }, function() {
        _this.notify.alert('Project could not be saved!');
      });
    },

    willTransition: function() {
      var project = get(this, 'controller.model');

      if (get(project, 'isDirty')) {
        project.rollback();
      }
    }
  }
});
