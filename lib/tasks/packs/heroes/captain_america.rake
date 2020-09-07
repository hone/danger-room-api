namespace :packs do
  desc "Insert Hero: Captain America"
  task :captain_america => :environment do
    pack_name = "Captain America"
    puts "Hero: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :hero)
    pack.identities.create(alter_ego: "Steve Rogers", hero: pack_name)
  end
end
