class MeterImporter::Processors::ActivityFileProcessor
  include Interactor

  def call
    puts context.file_contents.inspect
  end

end