@external(javascript, "./js/main.mjs", "getTime")
pub fn get_time() -> Float

@external(javascript, "./js/main.mjs", "timer")
pub fn timer(callback: fn() -> Nil, delay: Int) -> Nil

@external(javascript, "./js/main.mjs", "setStorage")
pub fn set_storage(key: String, val: Int) -> Nil

@external(javascript, "./js/main.mjs", "getStorage")
pub fn get_storage(key: String) -> any

@external(javascript, "./js/interop.mjs", "screenWidth")
pub fn screen_width() -> Int

@external(javascript, "./js/interop.mjs", "screenHeight")
pub fn screen_height() -> Int

@external(javascript, "./js/interop.mjs", "startDrawing")
pub fn start_drawing(x: Int, y: Int) -> any

@external(javascript, "./js/interop.mjs", "lineTo")
pub fn line_to(path: any, x: Int, y: Int) -> any

@external(javascript, "./js/interop.mjs", "arcTo")
pub fn arc_to(path: any, x1: Int, y1: Int, x2: Int, y2: Int, radius: Int) -> any

@external(javascript, "./js/interop.mjs", "draw")
pub fn draw(path: any) -> Nil

@external(javascript, "./js/interop.mjs", "drawRectangle")
pub fn draw_rectangle(x: Int, y: Int, width: Int, height: Int) -> Nil

@external(javascript, "./js/interop.mjs", "setColor")
pub fn set_color(r: Int, g: Int, b: Int) -> Nil
