class MeterImporter::FileProcessor
  include Interactor

  def call
    context.entries = []

    Zip::File.open_buffer(context.file_contents) do |zip_file|
      zip_file.each do |entry|
        if entry.file?
          # Read into memory
          context.entries << {
            file_name: entry.name,
            file_contents: entry.get_input_stream.read.force_encoding("UTF-8").gsub!("\xEF\xBB\xBF".force_encoding("UTF-8"), '')
          }
        end
      end
    end
  end

end