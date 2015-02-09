import Ember from 'ember';

var filterBy = Ember.computed.filterBy;

export default Ember.Controller.extend({
  projects: filterBy('model', 'isNew', false)
});
