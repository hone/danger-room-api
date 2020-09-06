namespace :packs do
  desc "Insert Core Set"
  task :core => :environment do
    ModularEncounterSetKlass = Struct.new(:name, :difficulty)
    IdentityKlass = Struct.new(:alter_ego, :hero)

    pack = Pack.create(name: "Core", pack_type: :core)

    %w(Rhino Klaw Ultron).each {|name| pack.scenarios.create(name: name) }

    [
      ModularEncounterSetKlass.new("Bomb Scare", 1),
      ModularEncounterSetKlass.new("Masters of Evil", 2),
      ModularEncounterSetKlass.new("Under Attack", 3),
      ModularEncounterSetKlass.new("Legions of Hydra", 4),
      ModularEncounterSetKlass.new("The Doomsday Chair", 5)
    ].each {|set| pack.modular_encounter_sets.create(name: set.name, difficulty: set.difficulty) }

    [
      IdentityKlass.new("Peter Parker", "Spider-Man"),
      IdentityKlass.new("Carol Danvers", "Captain Marvel"),
      IdentityKlass.new("Jennifer Walters", "She-Hulk"),
      IdentityKlass.new("Tony Stark", "Iron Man"),
      IdentityKlass.new("T'Challa", "Black Panther")
    ].each {|identity| pack.identities.create(alter_ego: identity.alter_ego, hero: identity.hero) }
  end
end
