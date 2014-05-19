require 'padrino-core/tasks'
require 'padrino-gen/command'
require 'padrino-core/cli/rake'

Sunspot.session = Sunspot::Padrino.build_session
Sunspot::Adapters::InstanceAdapter.register(Sunspot::Padrino::Adapters::ActiveRecordInstanceAdapter, ActiveRecord::Base)
Sunspot::Adapters::DataAccessor.register(Sunspot::Padrino::Adapters::ActiveRecordDataAccessor, ActiveRecord::Base)
ActiveRecord::Base.module_eval { include(Sunspot::Padrino::Searchable) }