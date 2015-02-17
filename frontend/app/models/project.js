import DS from 'ember-data';

export default DS.Model.extend({
  tasks: DS.hasMany('task', { async: true }),

  name: DS.attr('string'),
  description: DS.attr('string')
});
