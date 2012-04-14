EmberCart.cartsController = Ember.ArrayController.create
  content: Ember.computed( ->
    EmberCart.store.findAll(EmberCart.Cart)
  ).property()

  currentCart: Ember.computed( ->
    @get('content').filter((i) ->
      i.get('current') == true
    ).get('firstObject')
  ).property('content.@each.current')

  cartItemsCount: Ember.computed( ->
    count = 0
    @get('content').forEach (i) ->
      count += i.get('cartItemsCount')

    count
  ).property('content.@each.cartItemsCount')

  addCartItem: (attrs) ->
    @get('currentCart').addCartItem(attrs)
