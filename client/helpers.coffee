Template.registerHelper 'from_now', (input)-> moment(input).fromNow()
Template.registerHelper 'cal_time', (input)-> moment(input).calendar()

Template.registerHelper 'parent', () -> Template.parentData()
Template.registerHelper 'parent_doc', () ->
    Docs.findOne @parent_id
    # Template.parentData()
Template.registerHelper 'sort_label', () -> Session.get('sort_label')
Template.registerHelper 'sort_icon', () -> Session.get('sort_icon')
Template.registerHelper 'current_limit', () -> parseInt(Session.get('limit'))

Template.registerHelper 'cart_items', () ->
    Docs.find 
        model:'cart_item'
        _author_id:Meteor.userId()

Template.registerHelper 'ref_product', () ->
    Docs.findOne 
        _id: @product_id

Template.registerHelper 'current_username', () ->
    Router.current().params.username

Template.registerHelper 'rental', () ->
    Docs.findOne @rental_id
    # Template.parentData()

Template.registerHelper 'building_units', () ->
    current_building = Docs.findOne Router.current().params.doc_id
    Docs.find 
        model:'unit'
        building_code:current_building.building_code
        # building_id:Router.current().params.doc_id
        
    
    
    
Template.registerHelper 'active_path', (metric) ->
    false
Template.registerHelper 'sorting_up', () ->
    parseInt(Session.get('sort_direction')) is 1

Template.registerHelper 'friended_by_users', ()->
    Meteor.users.find 
        friend_ids:$in:[@_id]
Template.registerHelper 'friended_users', ()->
    Meteor.users.find 
        _id:$in:@friend_ids
Template.registerHelper 'user_from_id', (id)->
    Meteor.users.findOne id
Template.registerHelper 'skv_is', (key,value)->
    Session.equals(key,value)

Template.registerHelper 'gs', () ->
    Docs.findOne
        model:'global_settings'
Template.registerHelper 'display_mode', () -> Session.get('display_mode',true)
Template.registerHelper 'is_loading', () -> Session.get 'loading'
Template.registerHelper 'dev', () -> Meteor.isDevelopment
Template.registerHelper 'is_author', ()-> @_author_id is Meteor.userId()
Template.registerHelper 'is_handler', ()-> @handler_username is Meteor.user().username
Template.registerHelper 'is_owner', ()-> @owner_username is Meteor.user().username
Template.registerHelper 'is_grandparent_author', () ->
    grandparent = Template.parentData(2)
    grandparent._author_id is Meteor.userId()
Template.registerHelper 'to_percent', (number) -> (number*100).toFixed()
Template.registerHelper 'long_time', (input) -> moment(input).format("h:mm a")
Template.registerHelper 'long_date', (input) -> moment(input).format("dddd, MMMM Do h:mm a")
Template.registerHelper 'short_date', (input) -> moment(input).format("dddd, MMMM Do")
Template.registerHelper 'med_date', (input) -> moment(input).format("MMM D 'YY")
Template.registerHelper 'medium_date', (input) -> moment(input).format("MMMM Do YYYY")
# Template.registerHelper 'medium_date', (input) -> moment(input).format("dddd, MMMM Do YYYY")
Template.registerHelper 'today', () -> moment(Date.now()).format("dddd, MMMM Do a")
Template.registerHelper 'fixed', (input) ->
    if input
        input.toFixed(2)
Template.registerHelper 'int', (input) -> input.toFixed(0)
Template.registerHelper 'when', () -> moment(@_timestamp).fromNow()
Template.registerHelper 'from_now', (input) -> moment(input).fromNow()
Template.registerHelper 'cal_time', (input) -> moment(input).calendar()
Template.registerHelper 'last_initial', (user) ->
    @last_name[0]+'.'
Template.registerHelper 'first_letter', (user) ->
    @first_name[..0]+'.'
Template.registerHelper 'first_initial', (user) ->
    @first_name[..2]+'.'
    # moment(input).fromNow()
Template.registerHelper 'logging_out', () -> Session.get 'logging_out'
# Template.registerHelper 'is_event', () -> @shop_type is 'event'
# Template.registerHelper 'is_rental', () -> @model is 'rental'
# Template.registerHelper 'is_service', () -> @model is 'service'
# Template.registerHelper 'is_product', () -> @model is 'product'
Template.registerHelper 'upvote_class', () ->
    if Meteor.userId()
        if @upvoter_ids and Meteor.userId() in @upvoter_ids then 'green' else 'outline'
    else ''
Template.registerHelper 'downvote_class', () ->
    if Meteor.userId()
        if @downvoter_ids and Meteor.userId() in @downvoter_ids then 'red' else 'outline'
    else ''

Template.registerHelper 'current_month', () -> moment(Date.now()).format("MMMM")
Template.registerHelper 'current_day', () -> moment(Date.now()).format("DD")


Template.registerHelper 'current_delta', () -> Docs.findOne model:'delta'

Template.registerHelper 'hsd', () ->
    Docs.findOne
        model:'home_stats'


Template.registerHelper 'grabber', () ->
    Meteor.users.findOne
        _id:@grabber_id



Template.registerHelper 'is_grabber', () ->
    @grabber_id is Meteor.userId()

Template.registerHelper 'total_potential_revenue', () ->
    @price_per_serving * @servings_amount

# Template.registerHelper 'servings_available', () ->
#     @price_per_serving * @servings_amount

Template.registerHelper 'session_is', (key, value)->
    Session.equals(key, value)

Template.registerHelper 'key_value_is', (key, value)->
    # console.log 'key', key
    # console.log 'value', value
    # console.log 'this', this
    @["#{key}"] is value

Template.registerHelper 'is', (key, value)->
    # console.log 'key', key
    # console.log 'value', value
    # console.log 'this', this
    key is value

Template.registerHelper 'parent_key_value_is', (key, value)->
    # console.log 'key', key
    # console.log 'value', value
    # console.log 'this', this
    @["#{key}"] is value



# Template.registerHelper 'parent_template', () -> Template.parentData()
    # Session.get 'displaying_profile'

# Template.registerHelper 'checking_in_doc', () ->
#     Docs.findOne
#         model:'healthclub_session'
#         current:true
#      # Session.get('session_document')

# Template.registerHelper 'current_session_doc', () ->
#         Docs.findOne
#             model:'healthclub_session'
#             current:true



# Template.registerHelper 'checkin_guest_docs', () ->
#     Docs.findOne Router.current().params.doc_id
#     session_document = Docs.findOne Router.current().params.doc_id
#     # console.log session_document.guest_ids
#     Docs.find
#         _id:$in:session_document.guest_ids


Template.registerHelper '_author', () -> Meteor.users.findOne @_author_id
Template.registerHelper 'is_text', () ->
    # console.log @field_type
    @field_type is 'text'

Template.registerHelper 'template_parent', () ->
    # console.log Template.parentData()
    Template.parentData()

Template.registerHelper 'fields', () ->
    model = Docs.findOne
        model:'model'
        slug:Router.current().params.model_slug
    if model
        match = {}
        # if Meteor.user()
        #     match.view_roles = $in:Meteor.user().roles
        match.model = 'field'
        match.parent_id = model._id
        # console.log model
        cur = Docs.find match,
            sort:rank:1
        # console.log cur.fetch()
        cur

Template.registerHelper 'edit_fields', () ->
    model = Docs.findOne
        model:'model'
        slug:Router.current().params.model_slug
    if model
        Docs.find {
            model:'field'
            parent_id:model._id
            edit_roles:$in:Meteor.user().roles
        }, sort:rank:1

Template.registerHelper 'sortable_fields', () ->
    model = Docs.findOne
        model:'model'
        slug:Router.current().params.model_slug
    if model
        Docs.find {
            model:'field'
            parent_id:model._id
            sortable:true
        }, sort:rank:1



Template.registerHelper 'nl2br', (text)->
    nl2br = (text + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + '<br>' + '$2')
    new Spacebars.SafeString(nl2br)


Template.registerHelper 'loading_class', () ->
    if Session.get 'loading' then 'disabled' else ''

Template.registerHelper 'current_model', (input) ->
    Docs.findOne
        model:'model'
        slug: Router.current().params.model_slug

Template.registerHelper 'in_list', (key) ->
    if Meteor.userId()
        if @["#{key}"]
            if Meteor.userId() in @["#{key}"] then true else false


Template.registerHelper 'is_admin', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','admin'], Meteor.user().roles) then true else false
        if 'admin' in Meteor.user().roles then true else false
Template.registerHelper 'is_current_admin', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','admin'], Meteor.user().roles) then true else false
        if 'admin' in Meteor.user().current_roles then true else false




Template.registerHelper 'is_current_staff', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','staff'], Meteor.user().roles) then true else false
        if 'staff' in Meteor.user().current_roles then true else false
Template.registerHelper 'is_staff', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','staff'], Meteor.user().roles) then true else false
        if 'staff' in Meteor.user().roles then true else false



Template.registerHelper 'is_owner', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','staff'], Meteor.user().roles) then true else false
        if 'owner' in Meteor.user().roles then true else false
Template.registerHelper 'is_current_owner', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','staff'], Meteor.user().roles) then true else false
        if 'owner' in Meteor.user().current_roles then true else false

Template.registerHelper 'is_frontdesk', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','staff'], Meteor.user().roles) then true else false
        if 'frontdesk' in Meteor.user().roles then true else false
Template.registerHelper 'is_current_frontdesk', () ->
    if Meteor.user() and Meteor.user().roles
        # if _.intersection(['dev','staff'], Meteor.user().roles) then true else false
        if 'frontdesk' in Meteor.user().current_roles then true else false


Template.registerHelper 'is_dev', () ->
    if Meteor.user() and Meteor.user().roles
        if 'dev' in Meteor.user().roles then true else false

Template.registerHelper 'is_manager', () ->
    if Meteor.user() and Meteor.user().roles
        if 'manager' in Meteor.user().roles then true else false
Template.registerHelper 'is_current_manager', () ->
    if Meteor.user() and Meteor.user().roles
        if 'manager' in Meteor.user().current_roles then true else false

# Template.registerHelper 'is_handler', () ->
#     if Meteor.user() and Meteor.user().roles
#         if 'handler' in Meteor.user().roles then true else false
Template.registerHelper 'is_resident', () ->
    if Meteor.user() and Meteor.user().roles
        if 'resident' in Meteor.user().roles then true else false

Template.registerHelper 'is_member', () ->
    if Meteor.user() and Meteor.user().roles
        if 'member' in Meteor.user().roles then true else false
Template.registerHelper 'is_current_member', () ->
    if Meteor.user() and Meteor.user().roles
        if 'member' in Meteor.user().current_roles then true else false

Template.registerHelper 'is_resident_or_user', () ->
    if Meteor.user() and Meteor.user().roles
        # console.log _.intersection(Meteor.user().roles, ['resident','user']).length
        if _.intersection(Meteor.user().roles, ['resident','user']).length then true else false

Template.registerHelper 'is_staff_or_manager', () ->
    if Meteor.user() and Meteor.user().roles
        # console.log _.intersection(Meteor.user().roles, ['resident','user']).length
        if _.intersection(Meteor.user().roles, ['manager','staff']).length then true else false




Template.registerHelper 'user_is_resident', () -> if @roles and 'resident' in @roles then true else false
Template.registerHelper 'user_is_owner', () -> if @roles and 'owner' in @roles then true else false
Template.registerHelper 'user_is_staff', () -> if @roles and 'staff' in @roles then true else false
Template.registerHelper 'user_is_admin', () -> if @roles and 'admin' in @roles then true else false
Template.registerHelper 'user_is_member', () -> if @roles and 'member' in @roles then true else false
Template.registerHelper 'user_is_handler', () -> if @roles and 'handler' in @roles then true else false
Template.registerHelper 'user_is_resident_or_owner', () -> if @roles and _.intersection(@roles,['resident','owner']) then true else false

Template.registerHelper 'is_eric', () -> if Meteor.userId() and Meteor.userId() in ['ytjpFxiwnWaJELZEd','rDqxdcTBTszjeMh9T'] then true else false

Template.registerHelper 'current_user', () ->  Meteor.users.findOne username:Router.current().params.username
Template.registerHelper 'is_current_user', () ->
    if Meteor.user().username is Router.current().params.username
        true
    # else
    #     if Meteor.user().roles and 'dev' in Meteor.user().roles
    #         true
    #     else
    #         false
Template.registerHelper 'order_product', -> 
    Docs.findOne 
        _id:@product_id
    
    
Template.registerHelper 'view_template', -> "#{@field_type}_view"
Template.registerHelper 'edit_template', -> "#{@field_type}_edit"
Template.registerHelper 'is_model', -> @model is 'model'


# Template.body.events
#     'click .toggle_sidebar': -> $('.ui.sidebar').sidebar('toggle')

Template.registerHelper 'is_editing', () -> Session.equals 'editing_id', @_id
Template.registerHelper 'editing_doc', () ->
    Docs.findOne Session.get('editing_id')

Template.registerHelper 'can_edit', () ->
    if Meteor.user()
        Meteor.userId() is @_author_id or 'admin' in Meteor.user().roles

Template.registerHelper 'publish_when', () -> moment(@publish_date).fromNow()

Template.registerHelper 'current_doc', ->
    doc = Docs.findOne Router.current().params.doc_id
    user = Meteor.users.findOne Router.current().params.doc_id
    # console.log doc
    # console.log user
    if doc then doc else if user then user


Template.registerHelper 'user_from_username_param', () ->
    found = Meteor.users.findOne username:Router.current().params.username
    # console.log found
    found
Template.registerHelper 'field_value', () ->
    # console.log @
    parent = Template.parentData()
    parent5 = Template.parentData(5)
    parent6 = Template.parentData(6)


    if @direct
        parent = Template.parentData()
    else if parent5
        if parent5._id
            parent = Template.parentData(5)
    else if parent6
        if parent6._id
            parent = Template.parentData(6)
    if parent
        parent["#{@key}"]


Template.registerHelper 'sorted_field_values', () ->
    # console.log @
    parent = Template.parentData()
    parent5 = Template.parentData(5)
    parent6 = Template.parentData(6)


    if @direct
        parent = Template.parentData()
    else if parent5._id
        parent = Template.parentData(5)
    else if parent6._id
        parent = Template.parentData(6)
    if parent
        _.sortBy parent["#{@key}"], 'number'


Template.registerHelper 'is_marketplace', () -> @model is 'marketplace'
Template.registerHelper 'is_post', () -> @model is 'post'
Template.registerHelper 'is_food', () -> @model is 'food'


Template.registerHelper 'in_dev', () -> Meteor.isDevelopment

Template.registerHelper 'calculated_size', (metric) ->
    # console.log metric
    # console.log typeof parseFloat(@relevance)
    # console.log typeof (@relevance*100).toFixed()
    whole = parseInt(@["#{metric}"]*10)
    # console.log whole

    if whole is 2 then 'f2'
    else if whole is 3 then 'f3'
    else if whole is 4 then 'f4'
    else if whole is 5 then 'f5'
    else if whole is 6 then 'f6'
    else if whole is 7 then 'f7'
    else if whole is 8 then 'f8'
    else if whole is 9 then 'f9'
    else if whole is 10 then 'f10'



Template.registerHelper 'in_dev', () -> Meteor.isDevelopment


Template.registerHelper 'building_leader', () ->
    Meteor.users.findOne @leader_id


Template.registerHelper 'building_users', () ->
    Meteor.users.find
        _id: $in: @building_user_ids


Template.registerHelper 'delta_key_value_is', (key, value)->
    # console.log 'key', key
    # console.log 'value', value
    # console.log 'this', this
    delta = Docs.findOne model:'delta'
    delta["#{key}"] is value
