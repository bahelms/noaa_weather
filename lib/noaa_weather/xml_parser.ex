defmodule XMLParser do
  import Record
  defrecord :xml_element, extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  defrecord :xml_text, extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  def parse_xml(xml_string) do
    {xml, _} = :xmerl_scan.string(to_char_list(xml_string))
    elements = hd(:xmerl_xpath.string('/current_observation', xml))
      |> xml_element(:content)

    for element <- elements, filter_newlines(element), into: HashDict.new do
      key   = xml_element(element, :name)
      value = hd(xml_element(element, :content)) |> xml_text(:value)
      {key, to_string(value)}
    end
  end

  defp filter_newlines(element) do
    elem(element, 0) == :xmlElement
  end
end
