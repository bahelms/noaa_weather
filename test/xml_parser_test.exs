defmodule XMLParserTest do
  use ExUnit.Case
  import XMLParser

  def sample_noaa_xml do
    """
    <?xml version='1.0' encoding='ISO-8859-1'?>
    <?xml-stylesheet href='latest_ob.xsl' type='text/xsl'?>
    <current_observation version='1.0'>
      <location>Location Text</location>
      <station_id>KTNB</station_id>
    </current_observation>
    """
  end

  test "parses given xml string and returns a HashDict" do
    hash = %{ location: "Location Text", station_id: "KTNB" } 
      |> Enum.into(HashDict.new)
    result = parse_xml(sample_noaa_xml)

    assert result == hash
    assert result = %HashDict{}
  end

  test "parsing location from NOAA xml" do
    {xml, _} = :xmerl_scan.string(to_char_list(sample_noaa_xml))
    [title_record] = :xmerl_xpath.string('/current_observation/location/text()', xml)
    assert xml_text(title_record, :value) == 'Location Text'
  end
end

