import Ember from 'ember';

var get = Ember.get;

export default Ember.Route.extend({
  model: function() {
    var project = this.modelFor('project');
    var projectId = get(project, 'id');

    return this.store.find('task', { project_id: projectId });
  }
});
