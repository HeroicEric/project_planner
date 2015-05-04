import Ember from 'ember';

const get = Ember.get;
const set = Ember.set;

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('task');
  },

  actions: {
    save(task) {
      const project = this.modelFor('project');

      set(task, 'project', project);

      task.save().then(() => {
        const newTask = this.store.createRecord('task');
        set(this, 'controller.model', newTask);
        this.notify.success('Task saved successfully!');
      }, () => {
        set(task, 'project', null);
        this.notify.alert('Task could not be saved!');
      });
    },

    willTransition() {
      const task = get(this, 'controller.model');

      if (get(task, 'isNew')) {
        task.destroyRecord();
      }
    }
  }
});
