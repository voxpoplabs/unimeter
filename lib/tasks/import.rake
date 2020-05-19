namespace :polimeter do
  task :import_meter_contents, [:meter_id, :zip_file_path] => [ :environment ] do |t, args|
    MeterImporter::Organizer.call(
      meter_id: args[:meter_id],
      file_data: Pathname.new(args[:zip_file_path])
    )
  end
end