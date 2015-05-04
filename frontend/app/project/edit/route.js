import Ember from 'ember';

const get = Ember.get;

export default Ember.Route.extend({
  model() {
    return this.modelFor('project');
  },

  actions: {
    save(project) {
      project.save().then((project) => {
        this.transitionTo('project', project);
        this.notify.success('Project saved successfully!');
      }, () => {
        this.notify.alert('Project could not be saved!');
      });
    },

    willTransition() {
      const project = get(this, 'controller.model');

      if (get(project, 'isDirty')) {
        project.rollback();
      }
    }
  }
});
