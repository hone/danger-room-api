namespace :packs do
  desc "Insert Hero: Black Widow"
  task :black_widow => :environment do
    pack_name = "Black Widow"
    puts "Hero: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :hero)
    pack.identities.create(alter_ego: "Natasha Romanoff", hero: pack_name)
  end
end
