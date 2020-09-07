require_relative "../util"

namespace :packs do
  desc "Insert Campaign: The Rise of Red Skull"
  task :the_rise_of_red_skull => :environment do
    pack_name = "The Rise of Red Skull"
    puts "Campaign: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :campaign)

    ["Crossbones", "Absorbing Man", "Taskmaster", "Zola", "Red Skull"].each {|name| pack.scenarios.create(name: name) }

    ["Hydra Assault", "Hydra Patrol", "Weapon Master"].each {|name| pack.modular_encounter_sets.create(name: name) }

    [
      IdentityKlass.new("Cliff Barton", "Hawkeye"),
      IdentityKlass.new("Jessica Drew", "Spider-Woman", ['dual-aspects'])
    ].each {|identity| pack.identities.create(alter_ego: identity.alter_ego, hero: identity.hero, features: identity.features) }
  end
end
