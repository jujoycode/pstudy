// CreatedAt: Thu Sep 25 2025 14:55:25 GMT+0000 (Coordinated Universal Time)
// Number: 1000
// Title: A+B
// Level: Bronze V
// Link: https://www.acmicpc.net/problem/1000

use std::io;

fn main() {
    let mut input = String::new();

    io::stdin()
        .read_line(&mut input)
        .expect("입력에 실패했습니다.");

    let nums: Vec<i32> = input
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();

    println!("{}", nums[0] + nums[1]);
}
