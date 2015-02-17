import Ember from 'ember';

var alias = Ember.computed.alias;
var get = Ember.get;

export default Ember.Component.extend({
  task: null,
  errors: alias('task.errors'),

  actions: {
    save: function() {
      var task = get(this, 'task');
      this.sendAction('save', task);
    }
  }
});
