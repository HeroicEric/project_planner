import Ember from 'ember';

var get = Ember.get;

export default Ember.Route.extend({
  model: function() {
    return this.store.createRecord('project');
  },

  actions: {
    save: function(project) {
      var _this = this;

      project.save().then(function(project) {
        _this.notify.success('Project saved successfully!');
        _this.transitionTo('project', project);
      }, function() {
        _this.notify.alert('Project could not be saved!');
      });
    },

    willTransition: function() {
      var project = get(this, 'controller.model');

      if (get(project, 'isNew')) {
        project.destroyRecord();
      }
    }
  }
});
