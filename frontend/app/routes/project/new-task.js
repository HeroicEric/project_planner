import Ember from 'ember';

var get = Ember.get;
var set = Ember.set;

export default Ember.Route.extend({
  model: function() {
    return this.store.createRecord('task');
  },

  actions: {
    save: function(task) {
      var _this = this;
      var project = this.modelFor('project');

      set(task, 'project', project);

      task.save().then(function() {
        var newTask = _this.store.createRecord('task');
        set(_this, 'controller.model', newTask);
        _this.notify.success('Task saved successfully!');
      }, function() {
        set(task, 'project', null);
        _this.notify.alert('Task could not be saved!');
      });
    },

    willTransition: function() {
      var task = get(this, 'controller.model');

      if (get(task, 'isNew')) {
        task.destroyRecord();
      }
    }
  }
});
