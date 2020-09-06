module V1
  class ModularEncounterSetResource < JSONAPI::Resource
    attributes :name, :difficulty

    has_one :pack

    filters :name, :difficulty
  end
end
