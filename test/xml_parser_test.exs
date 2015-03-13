defmodule XMLParserTest do
  use ExUnit.Case

  def sample_xml do
    """
    <html>
    <head>
      <title>Hey there</title>
    </head>
    </html>
    """
  end
  
  test "plucking title" do
    {xml, _} = :xmerl_scan.string(to_char_list(sample_xml))
    [title] = :xmerl_xpath.string('/html/head/title', xml)
    assert title == :foo
  end
end
