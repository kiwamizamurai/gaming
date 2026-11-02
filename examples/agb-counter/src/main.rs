#![no_std]
#![no_main]

extern crate alloc;

mod counter;

use agb::{
    display::{
        Priority, Rgb, Rgb15,
        font::{Font, Layout, LayoutSettings, RegularBackgroundTextRenderer},
        tiled::{RegularBackground, RegularBackgroundSize, TileFormat},
    },
    include_font,
    input::{Button, ButtonController},
};
use alloc::{format, vec::Vec};
use counter::Counter;

static FONT: Font = include_font!("assets/ark-pixel-10px-proportional-ja.ttf", 10);

// For the memory article: where does each kind of value end up?
static STEP: i32 = 1;
static mut PRESSES: u32 = 7;
static mut ZEROED: u32 = 0;

const KEYINPUT: *const u16 = 0x0400_0130 as *const u16;

fn print_addresses() {
    let local = 0u32;
    let mut heap: Vec<u32> = Vec::new();
    heap.push(1);
    agb::println!("STEP     {:p} = {}", &raw const STEP, STEP);
    unsafe {
        agb::println!("PRESSES  {:p} = {}", &raw const PRESSES, *(&raw const PRESSES));
        agb::println!("ZEROED   {:p} = {}", &raw const ZEROED, *(&raw const ZEROED));
    }
    agb::println!("local    {:p}", &raw const local);
    agb::println!("Vec item {:p}", heap.as_ptr());
    agb::println!("counter step fn {:p}", Counter::increment as *const ());
}

// Draws the text on a new background. The renderer owns the letter tiles,
// so the caller has to keep it for as long as the background is shown.
fn draw(value: i32) -> (RegularBackground, RegularBackgroundTextRenderer) {
    let mut bg = RegularBackground::new(
        Priority::P0,
        RegularBackgroundSize::Background32x32,
        TileFormat::FourBpp,
    );
    let mut renderer = RegularBackgroundTextRenderer::new((16, 16), 0);
    // In agb 0.25.0, Layout returned nothing for the one-character string "0",
    // so the number is drawn together with a label.
    let text = format!("Count: {}", value);
    let layout = Layout::new(&text, &FONT, &LayoutSettings::new().with_max_line_length(200));
    for letters in layout {
        renderer.show(&mut bg, &letters);
    }
    (bg, renderer)
}

#[agb::entry]
fn main(mut gba: agb::Gba) -> ! {
    print_addresses();

    let mut gfx = gba.graphics.get();
    gfx.set_background_palette_colour(0, 0, Rgb::new(0, 97, 132).into());
    gfx.set_background_palette_colour(0, 1, Rgb15::WHITE);

    let mut buttons = ButtonController::new();
    let mut counter = Counter::new();
    let (mut bg, mut _renderer) = draw(counter.value());

    loop {
        // Input and update
        buttons.update();
        let before = counter.value();
        if buttons.is_just_pressed(Button::A) {
            counter.increment();
        }
        if buttons.is_just_pressed(Button::B) {
            counter.decrement();
        }
        if buttons.is_just_pressed(Button::Start) {
            counter.reset();
        }
        if counter.value() != before {
            let keys = unsafe { core::ptr::read_volatile(KEYINPUT) };
            agb::println!("counter = {} KEYINPUT = {:#012b}", counter.value(), keys);
            (bg, _renderer) = draw(counter.value());
        }

        let mut frame = gfx.frame();
        bg.show(&mut frame);
        frame.commit();
    }
}
