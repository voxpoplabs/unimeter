class MeterImporter::FileReader
  include Interactor

  def call
    if context.file_data.respond_to?(:read)
      context.file_contents = context.file_data.read
    elsif context.file_data.respond_to?(:path)
      context.file_contents = File.read(context.file_data.path, encoding: 'bom|utf-8')
    else
      context.fail!(message: "FileReader.invalid_file")
    end
  end


end