import DS from 'ember-data';

const hasMany = DS.hasMany;
const attr = DS.attr;

export default DS.Model.extend({
  tasks: hasMany('task', { async: true }),

  name: attr('string'),
  description: attr('string')
});
