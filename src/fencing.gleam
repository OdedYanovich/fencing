import drawing
import ffi/interop

pub fn main(state: Model, key) {
  let state =
    state
    + case key {
      "k" -> 3
      "j" -> -1
      _ -> 0
    }
  interop.set_color(0, 0, 0)
  interop.update_counter(state)
  interop.draw_rectangle(0, 0, interop.screen_width(), interop.screen_height())
  interop.set_color(255, 0, 0)
  drawing.start(100, 400)
  |> drawing.next_point(200, 400)
  |> drawing.next_point(500, 400)
  |> drawing.next_point(500, 420)
  |> drawing.next_point(100, 420)
  |> drawing.draw
  state
}

pub fn init() -> Model {
  interop.draw_rectangle(0, 0, interop.screen_width(), interop.screen_height())
  interop.set_color(255, 0, 0)
  let sword =
    drawing.start(100, 400)
    |> drawing.next_point(200, 400)
    |> drawing.next_point(500, 400)
    |> drawing.next_point(500, 420)
    |> drawing.next_point(100, 420)
  drawing.draw(sword)
  #(sword, 0)
}

type Model =
  #(drawing.Canvas, Int)
