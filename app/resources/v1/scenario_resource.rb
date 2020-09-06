module V1
  class ScenarioResource < JSONAPI::Resource
    immutable
    attributes :name

    has_one :pack

    filter :name
  end
end
