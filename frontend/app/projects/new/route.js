import Ember from 'ember';

const get = Ember.get;

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('project');
  },

  actions: {
    save(project) {
      project.save().then((project) => {
        this.notify.success('Project saved successfully!');
        this.transitionTo('project', project);
      }, () => {
        this.notify.alert('Project could not be saved!');
      });
    },

    willTransition() {
      const project = get(this, 'controller.model');

      if (get(project, 'isNew')) {
        project.destroyRecord();
      }
    }
  }
});
