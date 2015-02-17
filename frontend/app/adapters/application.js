import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  coalesceFindRequests: true,
  namespace: 'api/v1'
});
