import shared.{type Element}

@external(javascript, "./js/dom.mjs", "visibility")
pub fn visibility(element: Element) -> Nil

@external(javascript, "./js/dom.mjs", "get_elements")
pub fn get_elements() -> #(Element, Element, Element, Element, Element)

@external(javascript, "./js/dom.mjs", "write")
pub fn write(element: Element, text: String) -> Nil
