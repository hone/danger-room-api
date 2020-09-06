module V1
  class PackResource < JSONAPI::Resource
    immutable
    attributes :name, :pack_type

    has_many :identities
    has_many :scenarios
    has_many :modular_encounter_sets

    filters :name, :pack_type
  end
end
