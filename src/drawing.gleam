import ffi/interop
import gleam/dynamic/decode

pub opaque type Canvas {
  Canvas(d: decode.Dynamic)
}

pub fn start(x, y) {
  interop.start_drawing(x, y)
  |> Canvas
}

pub fn next_point(path: Canvas(any), x, y) {
  interop.line_to(path.d, x, y)
  |> Canvas
}

pub fn next_arc(path: Canvas(any), x1, y1, x2, y2, radius) {
  interop.arc_to(path.d, x1, y1, x2, y2, radius)
  |> Canvas
}

pub fn draw(path: Canvas(any)) {
  interop.draw(path.d)
}
