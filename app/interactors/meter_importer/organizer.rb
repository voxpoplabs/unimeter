class MeterImporter::Organizer
  include Interactor::Organizer

  organize [
    MeterImporter::MeterLoader,
    MeterImporter::FileReader,
    MeterImporter::FileProcessor,
    MeterImporter::EntryProcessor
  ]

end