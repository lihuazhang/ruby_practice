require "builder/xmlmarkup"

xml = Builder::XmlMarkup.new(:indent => 2)
puts xml.html {
  xml.head {
    xml.title("History")
  }
  xml.body {
    xml.h1("Header")
    xml.p {
      xml.text!("paragraph with")
      xml.a("a Link", "href" => "http://onestepback.org")
    }
  }
}
