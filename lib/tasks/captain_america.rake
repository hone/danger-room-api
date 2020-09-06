namespace :packs do
  desc "Insert Hero: Captain America"
  task :captain_america => :environment do
    pack = Pack.create(name: "Captain America", pack_type: :hero)
    pack.identities.create(alter_ego: "Steve Rogers", hero: "Captain America")
  end
end
