//! The counter's rules. This file uses nothing from agb or the GBA,
//! so it can be tested on a normal computer.

pub struct Counter {
    value: i32,
}

impl Counter {
    pub fn new() -> Self {
        Self { value: 0 }
    }

    pub fn increment(&mut self) {
        self.value += 1;
    }

    pub fn decrement(&mut self) {
        self.value -= 1;
    }

    pub fn reset(&mut self) {
        self.value = 0;
    }

    pub fn value(&self) -> i32 {
        self.value
    }
}

#[cfg(test)]
mod tests {
    use super::Counter;

    #[test]
    fn starts_at_zero() {
        assert_eq!(Counter::new().value(), 0);
    }

    #[test]
    fn increment_adds_one() {
        let mut counter = Counter::new();
        counter.increment();
        counter.increment();
        assert_eq!(counter.value(), 2);
    }

    #[test]
    fn decrement_can_go_below_zero() {
        let mut counter = Counter::new();
        counter.decrement();
        assert_eq!(counter.value(), -1);
    }

    #[test]
    fn reset_returns_to_zero() {
        let mut counter = Counter::new();
        counter.increment();
        counter.reset();
        assert_eq!(counter.value(), 0);
    }

    #[test]
    fn increment_and_decrement_cancel_out() {
        let mut counter = Counter::new();
        counter.increment();
        counter.decrement();
        assert_eq!(counter.value(), 0);
    }
}
