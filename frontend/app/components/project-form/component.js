import Ember from 'ember';

const alias = Ember.computed.alias;
const get = Ember.get;

export default Ember.Component.extend({
  project: null,
  errors: alias('project.errors'),

  actions: {
    save() {
      const project = get(this, 'project');
      this.sendAction('save', project);
    }
  }
});
