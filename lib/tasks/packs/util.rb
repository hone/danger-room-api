ModularEncounterSetKlass = Struct.new(:name, :difficulty)

class IdentityKlass
  attr_accessor :alter_ego, :hero, :features

  def initialize(alter_ego, hero, features = [])
    @alter_ego = alter_ego
    @hero      = hero
    @features  = features
  end
end
