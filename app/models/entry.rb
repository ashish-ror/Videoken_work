class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  field :entity_id, type: String, default: ''
  field :entity_tag, type: Array, default: []
  field :entity_type, type: String, default: ''
end