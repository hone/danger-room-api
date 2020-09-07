namespace :packs do
  desc "Insert Hero: Hulk"
  task :hulk => :environment do
    pack_name = "Hulk"
    puts "Hero: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :hero)
    pack.identities.create(alter_ego: "Bruce Banner", hero: pack_name)
  end
end
