module FlagsHelper

  def meter_country_flag_image(meter)
    "flags-country/#{ @meter.country ? @meter.country.partition("[").last.sub("]", "") : "zz" }.png"
  end

end