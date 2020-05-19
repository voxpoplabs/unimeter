class MeterImporter::MeterLoader
  include Interactor

  def call
    context.meter = Meter.find(context.meter_id)

    unless context.meter
      context.fail!(message: "MeterImporter.meter_not_found")
    end

  end

end