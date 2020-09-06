module V1
  class IdentityResource < JSONAPI::Resource
    immutable
    attributes :alter_ego, :hero

    has_one :pack

    filters :alter_ego, :hero
  end
end
