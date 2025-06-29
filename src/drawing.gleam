import ffi/interop
import gleam/dynamic/decode

pub opaque type Canvas {
  Canvas(d: decode.Dynamic)
}

pub fn start(x, y) {
  interop.start_drawing(x, y)
  |> Canvas
}

pub fn next_point(path: Canvas, x, y) {
  interop.line_to(path.d, x, y)
  |> Canvas
}

pub fn next_arc(path: Canvas, x1, y1, x2, y2, radius) {
  interop.arc_to(path.d, x1, y1, x2, y2, radius)
  |> Canvas
}

pub fn draw(path: Canvas) {
  interop.draw(path.d)
}
// let sword =
//   drawing.start(100, 400)
//   |> drawing.next_point(200, 400)
//   |> drawing.next_point(500, 400)
//   |> drawing.next_point(500, 420)
//   |> drawing.next_point(100, 420)
// drawing.draw(sword)
