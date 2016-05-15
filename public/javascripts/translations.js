I18n.translations || (I18n.translations = {});
I18n.translations["es"] = I18n.extend((I18n.translations["es"] || {}), {"about-us":{"history":{"content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis nisl, at aliquam dolor. Morbi in iaculis nunc. Nulla eu mi at velit imperdiet sollicitudin sed vel risus. Quisque eleifend lorem ipsum, et tempus nulla convallis nec. Duis molestie diam at molestie sodales. In convallis, dui in iaculis adipiscing, tortor neque elementum lectus, quis dapibus sapien metus vestibulum nibh. Curabitur fermentum molestie ipsum, a sagittis mi. Suspendisse tempus consequat odio, quis tempus augue vulputate at.","title":"HISTORIA"},"introduction":{"content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis nisl, at aliquam dolor. Morbi in iaculis nunc. Nulla eu mi at velit imperdiet sollicitudin sed vel risus. Quisque eleifend lorem ipsum, et tempus nulla convallis nec. Duis molestie diam at molestie sodales. In convallis, dui in iaculis adipiscing, tortor neque elementum lectus, quis dapibus sapien metus vestibulum nibh. Curabitur fermentum molestie ipsum, a sagittis mi. Suspendisse tempus consequat odio, quis tempus augue vulputate at.","title":"INTRODUCCIÓN"},"members":{"articles":"Publicaciones","developers":"DESARROLLADORES","title":"MIEMBROS"},"menu":{"history":"HISTORIA","introduction":"INTRODUCCIÓN","members":"MIEMBROS"}},"admin":{"delete-user-confirmation":"¿Estás seguro que quieres eliminar a ${username}?","user-list":"LISTA DE USUARIOS"},"country":"Venezuela","footer":{"info":"Información legal - Información de contacto"},"header":{"login":"Iniciar Sesión","logout":"Cerrar Sesión","menu":{"api":"API","community":"COMUNIDAD","doc":"DOCUMENTACIÓN","download":"DESCARGA","home":"INICIO","language":"IDIOMA","onlineTests":"PRUEBAS EN LÍNEA","performance":"DESEMPEÑO","team":"EQUIPO"},"register":"Registrarse","search":"Buscar"},"home":{"news":"Noticias","title":"Base de datos con atributos difusos"},"labels":{"close":"Cerrar","delete":"Eliminar","edit":"Editar","show":"Mostrar"},"tables":{"language":"//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"},"university":"Universidad Simón Bolívar","user":{"email":"Correo electrónico","name":"Nombre","username":"Nombre de usuario"}});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"about-us":{"history":{"title":"HISTORY"},"introduction":{"title":"INTRODUCTION"},"members":{"articles":"Articles","developers":"DEVELOPERS","title":"MEMBERS"},"menu":{"history":"HISTORY","introduction":"INTRODUCTION","members":"MEMBERS"}},"admin":{"delete-user-confirmation":"Are you sure you want to delete %{username}?","user-list":"USER LIST"},"country":"Venezuela","date":{"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"formats":{"default":"%Y-%m-%d","long":"%B %d, %Y","short":"%b %d"},"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"},"half_a_minute":"half a minute","less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"x_days":{"one":"1 day","other":"%{count} days"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"x_months":{"one":"1 month","other":"%{count} months"},"x_seconds":{"one":"1 second","other":"%{count} seconds"}},"prompts":{"day":"Day","hour":"Hour","minute":"Minute","month":"Month","second":"Seconds","year":"Year"}},"devise":{"confirmations":{"confirmed":"Your email address has been successfully confirmed.","send_instructions":"You will receive an email with instructions for how to confirm your email address in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid %{authentication_keys} or password.","last_attempt":"You have one more attempt before your account is locked.","locked":"Your account is locked.","not_found_in_database":"Invalid %{authentication_keys} or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your email address before continuing."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"password_change":{"subject":"Password Changed"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \"%{reason}\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions on how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password has been changed successfully. You are now signed in.","updated_not_active":"Your password has been changed successfully."},"registrations":{"destroyed":"Bye! Your account has been successfully cancelled. We hope to see you again soon.","signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirm link to confirm your new email address.","updated":"Your account has been updated successfully."},"sessions":{"already_signed_out":"Signed out successfully.","signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"unlocks":{"send_instructions":"You will receive an email with instructions for how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions for how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}},"errors":{"connection_refused":"Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n","format":"%{attribute} %{message}","messages":{"accepted":"must be accepted","already_confirmed":"was already confirmed, please try signing in","blank":"can't be blank","confirmation":"doesn't match %{attribute}","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","empty":"can't be empty","equal_to":"must be equal to %{count}","even":"must be even","exclusion":"is reserved","expired":"has expired, please request a new one","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","inclusion":"is not included in the list","invalid":"is invalid","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","not_a_number":"is not a number","not_an_integer":"must be an integer","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"},"odd":"must be odd","other_than":"must be other than %{count}","present":"must be blank","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"}},"unacceptable_request":"A supported version is expected in the Accept header.\n","unavailable_session":"Session %{id} is is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"},"flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"destroy":{"alert":"%{resource_name} could not be destroyed.","notice":"%{resource_name} was successfully destroyed."},"update":{"notice":"%{resource_name} was successfully updated."}}},"footer":{"info":"Legal information - Contact information"},"header":{"login":"Log in","logout":"Log out","menu":{"api":"API","community":"COMMUNITY","doc":"DOCUMENTATION","download":"DOWNLOAD","home":"HOME","language":"LANGUAGE","onlineTests":"ONLINE TESTS","performance":"PERFORMANCE","team":"TEAM"},"register":"Register","search":"Search"},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","submit":"Save %{model}","update":"Update %{model}"}},"home":{"news":"News","title":"Database with fuzzy attributes"},"labels":{"close":"Close","delete":"Delete","edit":"Edit","show":"Show"},"mongoid":{"errors":{"messages":{"ambiguous_relationship":{"message":"Ambiguous relations %{candidates} defined on %{klass}.","resolution":"On the %{name} relation on %{inverse} you must add an :inverse_of option to specify the exact relationship on %{klass} that is the opposite of %{name}.","summary":"When Mongoid attempts to set an inverse document of a relation in memory, it needs to know which relation it belongs to. When setting %{name}, Mongoid looked on the class %{inverse} for a matching relation, but multiples were found that could potentially match: %{candidates}."},"blank_in_locale":"can't be blank in %{location}","callbacks":{"message":"Calling %{method} on %{klass} resulted in a false return from a callback.","resolution":"Double check all before callbacks to make sure they are not unintentionally returning false.","summary":"If a before callback returns false when using Document.create!, Document#save!, or Document#update_attributes! this error will get raised since the document did not actually get saved."},"calling_document_find_with_nil_is_invalid":{"message":"Calling Document.find with nil is invalid.","resolution":"Most likely this is caused by passing parameters directly through to the find, and the parameter either is not present or the key from which it is accessed is incorrect.","summary":"Document.find expects the parameters to be 1 or more ids, and will return a single document if 1 id is provided, otherwise an array of documents if multiple ids are provided."},"delete_restriction":{"message":"Cannot delete %{document} because of dependent '%{relation}'.","resolution":"Don't attempt to delete the parent %{document} when it has children, or change the dependent option on the relation.","summary":"When defining '%{relation}' with a :dependent =\u003e :restrict, Mongoid will raise an error when attempting to delete the %{document} when the child '%{relation}' still has documents in it."},"document_not_destroyed":{"message":"%{klass} with id %{id} was not destroyed.","resolution":"Check the before/after destroy callbacks to ensure that the return values are truthy for the chain to continue.","summary":"When calling %{klass}#destroy! and a callback halts the destroy callback chain by returning a false value, the deletion will not actually occur."},"document_not_found":{"message":"Document(s) not found for class %{klass} with id(s) %{missing}.","resolution":"Search for an id that is in the database or set the Mongoid.raise_not_found_error configuration option to false, which will cause a nil to be returned instead of raising this error when searching for a single id, or only the matched documents when searching for multiples.","summary":"When calling %{klass}.find with an id or array of ids, each parameter must match a document in the database or this error will be raised. The search was for the id(s): %{searched} (%{total} total) and the following ids were not found: %{missing}."},"document_with_attributes_not_found":{"message":"Document not found for class %{klass} with attributes %{attributes}.","resolution":"Search for attributes that are in the database or set the Mongoid.raise_not_found_error configuration option to false, which will cause a nil to be returned instead of raising this error.","summary":"When calling %{klass}.find_by with a hash of attributes, all attributes provided must match a document in the database or this error will be raised."},"eager_load":{"message":"Eager loading :%{name} is not supported since it is a polymorphic belongs_to relation.","resolution":"Don't attempt to perform this action and have patience, maybe this will be supported in the future.","summary":"Mongoid cannot currently determine the classes it needs to eager load when the relation is polymorphic. The parents reside in different collections so a simple id lookup is not sufficient enough."},"invalid_collection":{"message":"Access to the collection for %{klass} is not allowed.","resolution":"For access to the collection that the embedded document is in, use %{klass}#_root.collection, or do not attempt to persist an embedded document without a parent set.","summary":"%{klass}.collection was called, and %{klass} is an embedded document - it resides within the collection of the root document of the hierarchy."},"invalid_config_option":{"message":"Invalid configuration option: %{name}.","resolution":"Remove the invalid option or fix the typo. If you were expecting the option to be there, please consult the following page with repect to Mongoid's configuration:\n\n   http://mongoid.org/en/mongoid/docs/installation.html","summary":"A invalid configuration option was provided in your mongoid.yml, or a typo is potentially present. The valid configuration options are: %{options}."},"invalid_field":{"message":"Defining a field named '%{name}' is not allowed.","resolution":"Use Mongoid.destructive_fields to see what names are not allowed, and don't use these names. These include names that also conflict with core Ruby methods on Object, Module, Enumerable, or included gems that inject methods into these or Mongoid internals.","summary":"Defining this field would override the method '%{name}', which would cause issues with expectations around the original method and cause extremely hard to debug issues. The original method was defined in:\n   Object: %{origin}\n   File: %{file}\n   Line: %{line}"},"invalid_field_option":{"message":"Invalid option :%{option} provided for field :%{name}.","resolution":"When defining the field :%{name} on '%{klass}', please provide valid options for the field. These are currently: %{valid}. If you meant to define a custom field option, please do so first like so:\n\n   Mongoid::Fields.option :%{option} do |model, field, value|\n     # Your logic here...\n   end\n   class %{klass}\n     include Mongoid::Document\n     field :%{name}, %{option}: true\n   end\n\n","summary":"Mongoid requires that you only provide valid options on each field definition in order to prevent unexpected behaviour later on."},"invalid_includes":{"message":"Invalid includes directive: %{klass}.includes(%{args})","resolution":"Ensure that each parameter passed to %{klass}.includes is a valid name of a relation on the %{klass} model. These are: %{relations}.","summary":"Eager loading in Mongoid only supports providing arguments to %{klass}.includes that are the names of relations on the %{klass} model, and only supports one level of eager loading. (ie, eager loading associations not on the %{klass} but one step away via another relation is not allowed."},"invalid_index":{"message":"Invalid index specification on %{klass}: %{spec}, %{options}","resolution":"Ensure that the index conforms to the correct syntax and has the correct options.\n\n Valid options are:\n   background: true|false\n   database: 'database_name'\n   drop_dups: true|false\n   name: 'index_name'\n   sparse: true|false\n   unique: true|false\n   min: 1\n   max: 1\n   bits: 26\n   bucket_size : 1\n   weights: { content: 1, title: 2 }\n   expire_after_seconds: number_of_seconds\n Valid types are: 1, -1, '2d', '2dsphere', 'geoHaystack', 'text', 'hashed'\n\n Example:\n   class Band\n     include Mongoid::Document\n     index({ name: 1, label: -1 }, { sparse: true })\n     index({ location: '2d' }, { background: true })\n   end\n\n","summary":"Indexes in Mongoid are defined as a hash of field name and direction/2d pairs, with a hash for any additional options."},"invalid_options":{"message":"Invalid option :%{invalid} provided to relation :%{name}.","resolution":"Valid options are: %{valid}, make sure these are the ones you are using.","summary":"Mongoid checks the options that are passed to the relation macros to ensure that no ill side effects occur by letting something slip by."},"invalid_path":{"message":"Having a root path assigned for %{klass} is invalid.","resolution":"Most likely your embedded model, %{klass} is also referenced via a has_many from a root document in another collection. Double check the relation definitions and fix any instances where embedded documents are improperly referenced from other collections.","summary":"Mongoid has two different path objects for determining the location of a document in the database, Root and Embedded. This error is raised when an embedded document somehow gets a root path assigned."},"invalid_scope":{"message":"Defining a scope of value %{value} on %{klass} is not allowed.","resolution":"Change the scope to be a proc wrapped critera.\n\n Example:\n   class Band\n     include Mongoid::Document\n     scope :inactive, -\u003e{ where(active: false) }\n   end\n\n","summary":"Scopes in Mongoid must be procs that wrap criteria objects."},"invalid_set_polymorphic_relation":{"message":"The %{name} attribute can't be set to an instance of %{other_klass} as %{other_klass} has multiple relations referencing %{klass} as %{name}.","resolution":"Set the values from the parent, or redefine the relation with only a single definition in the parent.","summary":"If the parent class of a polymorphic relation has multiple definitions for the same relation, the values must be set from the parent side and not the child side since Mongoid cannot determine from the child side which relation to go in."},"invalid_storage_options":{"message":"Invalid options passed to %{klass}.store_in: %{options}.","resolution":"Change the options passed to store_in to match the documented API, and ensure all keys in the options hash are symbols.\n\n Example:\n   class Band\n     include Mongoid::Document\n     store_in collection: 'artists', database: 'secondary'\n   end\n\n","summary":"The :store_in macro takes only a hash of parameters with the keys :database, :collection, or :client."},"invalid_storage_parent":{"message":"Invalid store_in call on class %{klass}.","resolution":"Remove the store_in call on class %{klass}, as it will use its parent store configuration. Or remove the hierarchy extension for this class.","summary":"The :store_in macro can only be called on a base Mongoid Document"},"invalid_time":{"message":"'%{value}' is not a valid Time.","resolution":"Make sure to pass parsable values to the field setter for Date, DateTime, and Time objects. When this is a String it needs to be valid for Time.parse. Other objects must be valid to pass to Time.local.","summary":"Mongoid tries to serialize the values for Date, DateTime, and Time into proper UTC times to store in the database. The provided value could not be parsed."},"invalid_value":{"message":"Value of type %{value_class} cannot be written to a field of type %{field_class}","resolution":"Verify if the value to be set correspond to field definition","summary":"Tried to set a value of type %{value_class} to a field of type %{field_class}"},"inverse_not_found":{"message":"When adding a(n) %{klass} to %{base}#%{name}, Mongoid could not determine the inverse foreign key to set. The attempted key was '%{inverse}'.","resolution":"If an inverse is not required, like a belongs_to or has_and_belongs_to_many, ensure that :inverse_of =\u003e nil is set on the relation. If the inverse is needed, most likely the inverse cannot be figured out from the names of the relations and you will need to explicitly tell Mongoid on the relation what the inverse is.\n\n Example:\n   class Lush\n     include Mongoid::Document\n     has_one :whiskey, class_name: \"Drink\", inverse_of: :alcoholic\n   end\n\n   class Drink\n     include Mongoid::Document\n     belongs_to :alcoholic, class_name: \"Lush\", inverse_of: :whiskey\n   end","summary":"When adding a document to a relation, Mongoid attempts to link the newly added document to the base of the relation in memory, as well as set the foreign key to link them on the database side. In this case Mongoid could not determine what the inverse foreign key was."},"message_title":"message","mixed_client_configuration":{"message":"Both uri and standard configuration options defined for client: '%{name}'.","resolution":"Provide either only a uri as configuration or only standard options.","summary":"Instead of simply giving uri or standard options a preference order, Mongoid assumes that you have made a mistake in your configuration and requires that you provide one or the other, but not both. The options that were provided were: %{config}."},"mixed_relations":{"message":"Referencing a(n) %{embedded} document from the %{root} document via a relational association is not allowed since the %{embedded} is embedded.","resolution":"Consider not embedding %{embedded}, or do the key storage and access in a custom manner in the application code.","summary":"In order to properly access a(n) %{embedded} from %{root} the reference would need to go through the root document of %{embedded}. In a simple case this would require Mongoid to store an extra foreign key for the root, in more complex cases where %{embedded} is multiple levels deep a key would need to be stored for each parent up the hierarchy."},"nested_attributes_metadata_not_found":{"message":"Could not find metadata for relation '%{name}' on model: %{klass}.","resolution":"Make sure that there is a relation defined named '%{name}' on %{klass} or that the relation definition comes before the accepts_nested_attributes_for macro in the model - order matters so that Mongoid has access to the metadata.\n\n Example:\n   class Band\n     include Mongoid::Document\n     has_many :albums\n     accepts_nested_attributes_for :albums\n   end\n\n","summary":"When defining nested attributes for a relation, Mongoid needs to access the metadata for the relation '%{name}' in order if add autosave functionality to it, if applicable. Either no relation named '%{name}' could be found, or the relation had not been defined yet."},"no_client_config":{"message":"No configuration could be found for a client named '%{name}'.","resolution":"Double check your mongoid.yml to make sure under the clients key that a configuration exists for '%{name}'. If you have set the configuration programatically, ensure that '%{name}' exists in the configuration hash.","summary":"When attempting to create the new client, Mongoid could not find a client configuration for the name: '%{name}'. This is necessary in order to know the host, port, and options needed to connect."},"no_client_database":{"message":"No database provided for client configuration: :%{name}.","resolution":"If configuring via a mongoid.yml, ensure that within your :%{name} section a :database value for the client's default database is defined.\n\n Example:\n   development:\n     clients:\n       %{name}:\n         database: my_app_db\n         hosts:\n           - localhost:27017\n\n","summary":"Each client configuration must provide a database so Mongoid knows where the default database to persist to. What was provided was: %{config}."},"no_client_hosts":{"message":"No hosts provided for client configuration: :%{name}.","resolution":"If configuring via a mongoid.yml, ensure that within your :%{name} section a :hosts value for the client hosts is defined.\n\n Example:\n   development:\n     clients:\n       %{name}:\n         database: my_app_db\n         hosts:\n           - localhost:27017\n\n","summary":"Each client configuration must provide hosts so Mongoid knows where the database server is located. What was provided was: %{config}."},"no_clients_config":{"message":"No clients configuration provided.","resolution":"Double check your mongoid.yml to make sure that you have a top-level clients key with at least 1 default client configuration for it. You can regenerate a new mongoid.yml for assistance via `rails g mongoid:config`.\n\n Example:\n   development:\n     clients:\n       default:\n         database: mongoid_dev\n         hosts:\n           - localhost:27017\n\n","summary":"Mongoid's configuration requires that you provide details about each client that can be connected to, and requires in the clients config at least 1 default client to exist."},"no_default_client":{"message":"No default client configuration is defined.","resolution":"If configuring via a mongoid.yml, ensure that within your :clients section a :default client is defined.\n\n Example:\n   development:\n     clients:\n       default:\n         hosts:\n           - localhost:27017\n\n","summary":"The configuration provided settings for: %{keys}, but Mongoid requires a :default to be defined at minimum."},"no_environment":{"message":"Could not load the configuration since no environment was defined.","resolution":"Make sure some environment is set from the mentioned options. Mongoid cannot load configuration from the yaml without knowing which environment it is in, and we have considered defaulting to development an undesireable side effect of this not being defined.","summary":"Mongoid attempted to find the appropriate environment but no Rails.env, Sinatra::Base.environment, RACK_ENV, or MONGOID_ENV could be found."},"no_map_reduce_output":{"message":"No output location was specified for the map/reduce operation.","resolution":"Provide the location that the output of the operation is to go by chaining an #out call to the map/reduce.\n\n Example:\n   Band.map_reduce(map, reduce).out(inline: 1)\n\n Valid options for the out function are:\n   inline:  1\n   merge:   'collection-name'\n   replace: 'collection-name'\n   reduce:  'collection-name'\n\n","summary":"When executing a map/reduce, you must provide the output location of the results. The attempted command was: %{command}."},"no_metadata":{"message":"Metadata not found for document of type %{klass}.","resolution":"Ensure that your relations on the %{klass} model are all properly defined, and that the inverse relations are also properly defined. Embedded relations must have both the parent (embeds_one/embeds_many) and the inverse (embedded_in) present in order to work properly.","summary":"Mongoid sets the metadata of a relation on the document when it is either loaded from within the relation, or added to one. The presence of the metadata is required in order to provide various functionality around relations. Most likely you are getting this error because the document is embedded and was attempted to be persisted without being associated with a parent, or the relation was not properly defined."},"no_parent":{"message":"Cannot persist embedded document %{klass} without a parent document.","resolution":"Ensure that you've set the parent relation if instantiating the embedded document directly, or always create new embedded documents via the parent relation.","summary":"If the document is embedded, in order to be persisted it must always have a reference to its parent document. This is most likely caused by either calling %{klass}.create or %{klass}.create! without setting the parent document as an attribute."},"readonly_attribute":{"message":"Attempted to set the readonly attribute '%{name}' with the value: %{value}.","resolution":"Don't define '%{name}' as readonly, or do not attempt to update its value after the document is persisted.","summary":"Attributes flagged as readonly via Model.attr_readonly can only have values set when the document is a new record."},"readonly_document":{"message":"Attempted to persist the readonly document '%{klass}'.","resolution":"Don't attempt to persist documents that are flagged as readonly.","summary":"Documents loaded from the database using #only cannot be persisted."},"resolution_title":"resolution","scope_overwrite":{"message":"Cannot create scope :%{scope_name}, because of existing method %{model_name}.%{scope_name}.","resolution":"Change the name of the scope so it does not conflict with the already defined method %{model_name}, or set the configuration option Mongoid.scope_overwrite_exception to false, which is its default. In this case a warning will be logged.","summary":"When defining a scope that conflicts with a method that already exists on the model, this error will get raised if Mongoid.scope_overwrite_exception is set to true."},"summary_title":"summary","taken":"is already taken","too_many_nested_attribute_records":{"message":"Accepting nested attributes for %{association} is limited to %{limit} records.","resolution":"The limit is set as an option to the macro, for example: accepts_nested_attributes_for :%{association}, limit: %{limit}. Consider raising this limit or making sure no more are sent than the set value.","summary":"More documents were sent to be processed than the allowed limit."},"unknown_attribute":{"message":"Attempted to set a value for '%{name}' which is not allowed on the model %{klass}.","resolution":"You can include Mongoid::Attributes::Dynamic if you expect to be writing values for undefined fields often.","summary":"Without including Mongoid::Attributes::Dynamic in your model and the attribute does not already exist in the attributes hash, attempting to call %{klass}#%{name}= for it is not allowed. This is also triggered by passing the attribute to any method that accepts an attributes hash, and is raised instead of getting a NoMethodError."},"unsaved_document":{"message":"Attempted to save %{document} before the parent %{base}.","resolution":"Make sure to only use create or create! when the parent document %{base} is persisted.","summary":"You cannot call create or create! through the relation (%{document}) who's parent (%{base}) is not already saved. This would case the database to be out of sync since the child could potentially reference a nonexistant parent."},"unsupported_javascript":{"message":"Executing Javascript $where selector on an embedded criteria is not supported.","resolution":"Please provide a standard hash to #where when the criteria is for an embedded relation.","summary":"Mongoid only supports providing a hash of arguments to #where criterion on embedded documents. Since %{klass} is embedded, the expression %{javascript} is not allowed."},"validations":{"message":"Validation of %{document} failed.","resolution":"Try persisting the document with valid data or remove the validations.","summary":"The following errors were found: %{errors}"}}}},"number":{"currency":{"format":{"delimiter":",","format":"%u%n","precision":2,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"$"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"Billion","million":"Million","quadrillion":"Quadrillion","thousand":"Thousand","trillion":"Trillion","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"gb":"GB","kb":"KB","mb":"MB","tb":"TB"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"support":{"array":{"last_word_connector":", and ","two_words_connector":" and ","words_connector":", "}},"tables":{"language":""},"time":{"am":"am","formats":{"default":"%a, %d %b %Y %H:%M:%S %z","long":"%B %d, %Y %H:%M","short":"%d %b %H:%M"},"pm":"pm"},"university":"Simon Bolivar University","user":{"email":"e-mail","name":"Name","username":"Username"}});
