import Ember from 'ember';

const alias = Ember.computed.alias;
const get = Ember.get;

export default Ember.Component.extend({
  task: null,
  errors: alias('task.errors'),

  actions: {
    save() {
      const task = get(this, 'task');
      this.sendAction('save', task);
    }
  }
});
