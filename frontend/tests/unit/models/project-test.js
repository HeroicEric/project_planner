import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('project', 'Project', {
  needs: ['model:task']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
