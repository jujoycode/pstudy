use std::io::{self, BufRead, BufReader};

fn main() {
    let stdin = io::stdin();
    let mut reader = BufReader::new(stdin.lock());
    
    // 입력 읽기 예시
    let mut line = String::new();
    reader.read_line(&mut line).unwrap();
    let n: i32 = line.trim().parse().unwrap();
    
    // 여러 값 읽기 예시
    line.clear();
    reader.read_line(&mut line).unwrap();
    let nums: Vec<i32> = line
        .trim()
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();
    
    // 솔루션 로직
    let result = solve(n, nums);
    println!("{}", result);
}

fn solve(n: i32, nums: Vec<i32>) -> i32 {
    // 여기에 솔루션 구현
    0
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_example_1() {
        assert_eq!(solve(3, vec![1, 2, 3]), 6);
    }
    
    #[test]
    fn test_example_2() {
        // 추가 테스트 케이스
    }
}