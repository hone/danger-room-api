namespace :packs do
  desc "Insert Hero: Thor"
  task :thor => :environment do
    pack_name = "Thor"
    puts "Hero: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :hero)
    pack.identities.create(alter_ego: "Odinson", hero: pack_name)
  end
end
