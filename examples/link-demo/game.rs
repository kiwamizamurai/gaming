#![no_std]
unsafe extern "C" {
    fn increment(value: i32) -> i32;
}
#[unsafe(no_mangle)]
pub extern "C" fn main() -> i32 {
    unsafe { increment(41) }
}
