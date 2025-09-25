import { writeFile } from "fs/promises";
import type { Ora } from "ora";
import path from "path";
import { ProjectConstant } from "../constants/ProjectConstant.js";
import type { Problem } from "../types/interface.js";

export async function makePSFile(problem: Problem, spinner: Ora) {
  try {
    await writeFile(
      path.resolve(ProjectConstant.TARGET_PATH, `${problem.problemId}.rs`),
      `// CreatedAt: ${new Date()}
// Number: ${problem.problemId}
// Title: ${problem.titleKo}
// Level: ${ProjectConstant.SOLVED_AC_TEAR[problem.level]}
// Link: https://www.acmicpc.net/problem/${problem.problemId}

use std::io;

fn main() {
    let mut input = String::new();
    
    // 한 줄 입력 처리
    io::stdin()
        .read_line(&mut input)
        .expect("입력에 실패했습니다.");
    
    // 공백을 기준으로 값 분리
    let nums: Vec<i32> = input
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();
    
    println!("");
}

      `
    );

    // 성공 시
    spinner.succeed(
      ` Files generated successfully for problem ${problem.problemId}`
    );
  } catch (error) {
    // 실패 시
    spinner.fail(` Failed to generate files\n ${error}`);
  }
}
