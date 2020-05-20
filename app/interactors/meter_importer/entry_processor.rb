class MeterImporter::EntryProcessor
  include Interactor

  def call
    context.entries.each do |entry_file_obj|
      case entry_file_obj[:file_name]
        when "promises.csv"
          MeterImporter::Processors::PromiseFileProcessor.call(
            meter: context.meter,
            file_contents: entry_file_obj[:file_contents]
          )

        when "articles.csv"
          MeterImporter::Processors::ArticleFileProcessor.call(
            meter: context.meter,
            file_contents: entry_file_obj[:file_contents]
          )
      end
    end
  end

end