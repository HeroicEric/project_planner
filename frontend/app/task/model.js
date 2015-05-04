import DS from 'ember-data';

const belongsTo = DS.belongsTo;
const attr = DS.attr;

export default DS.Model.extend({
  project: belongsTo('project', { async: true }),

  title: attr('string'),
  decription: attr('string')
});
