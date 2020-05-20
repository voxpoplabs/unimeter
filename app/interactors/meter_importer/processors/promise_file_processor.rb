require 'csv'

class MeterImporter::Processors::PromiseFileProcessor
  include Interactor

  def call
    CSV.parse(context.file_contents, col_sep: ";", headers: true) do |row|
      process_row(row)
    end
  end

  protected

  def process_row(row)
    promise = context.meter.promises.find_by(
      external_identifier: row["external_identifier"]
    )

    if promise
      promise.update(row.to_h).inspect
    else
      context.meter.promises.create(row.to_h)
    end
  end

end