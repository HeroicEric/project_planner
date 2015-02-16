import Ember from 'ember';

var alias = Ember.computed.alias;
var get = Ember.get;

export default Ember.Component.extend({
  project: null,
  errors: alias('project.errors'),

  actions: {
    save: function() {
      var project = get(this, 'project');
      this.sendAction('save', project);
    }
  }
});
