import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('projects', function() {
    this.route('new');
  });

  this.route('project', { path: 'projects/:project_id' }, function() {
    this.route('edit');
    this.route('new-task', { path: 'tasks/new' });
    this.route('task', { path: 'tasks/:task_id' });
  });
});

export default Router;
