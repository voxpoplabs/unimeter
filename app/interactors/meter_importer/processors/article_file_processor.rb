require 'csv'

class MeterImporter::Processors::ArticleFileProcessor
  include Interactor

  def call
    CSV.parse(context.file_contents, col_sep: ";", headers: true) do |row|
      process_row(row)
    end
  end

  protected

  def process_row(row)
    promise = context.meter.promises.find_by(
      external_identifier: row["external_promise_identifier"]
    )

    if promise
      article = promise.articles.find_by(
        external_identifier: row["external_identifier"]
      )

      if article
        promise.articles.update(row.to_h.except("external_promise_identifier"))
      else
        promise.articles.create(row.to_h.except("external_promise_identifier"))
      end
    end
  end

end