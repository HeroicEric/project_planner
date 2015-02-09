import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('projects', function() {
    this.route("show", { path: ':project_id' });
  });
});

export default Router;
