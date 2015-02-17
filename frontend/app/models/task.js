import DS from 'ember-data';

export default DS.Model.extend({
  project: DS.belongsTo('project', { async: true }),

  title: DS.attr('string'),
  decription: DS.attr('string')
});
