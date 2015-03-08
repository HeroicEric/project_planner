import {
  moduleForModel,
  test
} from 'ember-qunit';

moduleForModel('task', {
  needs: ['model:project']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
