defmodule ExampleXMLParsingTest do
  use ExUnit.Case

  def sample_xml do
    """
    <html>
    <head>
      <title>Hey there</title>
    </head>
    <body>
      <ul>
        <p>First</p>
        <p>Second</p>
        <div>Third</div>
      </ul>
    </body>
    </html>
    """
  end
  
  test "plucking title manually" do
    {xml, _} = :xmerl_scan.string(to_char_list(sample_xml))

    # Returns list of xmlElement records
    [title_element] = :xmerl_xpath.string('/html/head/title', xml)

    # Returns list of xmlText records
    [title_record] = xml_element(title_element, :content)
    assert xml_text(title_record, :value) == 'Hey there'
  end

  test "plucking title through xpath function" do
    {xml, _} = :xmerl_scan.string(to_char_list(sample_xml))

    # Returns list of xmlText records directly
    [title_record] = :xmerl_xpath.string('/html/head/title/text()', xml)
    assert xml_text(title_record, :value) == 'Hey there'
  end
end

