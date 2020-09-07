namespace :packs do
  desc "Insert Hero: Ms. Marvel"
  task :ms_marvel => :environment do
    pack_name = "Ms. Marvel"
    puts "Hero: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :hero)
    pack.identities.create(alter_ego: "Kamala Khan", hero: pack_name)
  end
end
