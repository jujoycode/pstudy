#!/usr/bin/env node

import ora from "ora";
import { ProjectConstant } from "./constants/ProjectConstant.js";
import { makePSFile } from "./funcs/makePSFile.js";
import { initProgram } from "./libs/commander.js";
import { fetcher } from "./libs/fetcher.js";
import { Prompt } from "./libs/prompts.js";

// init
async function main() {
  initProgram();

  // 1. 문제 번호 입력
  const problemNumber = await Prompt.number({
    message: ProjectConstant.Q_PROBLEM_NUMBER,
    required: true,
  });

  // 2. 번호에 해당하는 문제 정보 조회

  const objResponse = await fetcher().get(
    `${ProjectConstant.SOLVED_AC_API_URL.PROBLEM}/show`,
    { params: { problemId: problemNumber } }
  );

  try {
    // 3. 문제 정보 파싱 및 파일 생성 준비
    const spinner = ora(
      ` Generating files for problem ${problemNumber}...`
    ).start();

    await makePSFile(JSON.parse(objResponse.data), spinner);
  } catch (error) {
    // *. 번호에 해당하는 문제가 없는 경우로, 프로그램 종료 혹은 재실행 여부 질의
    const isRetry = await Prompt.confirm({
      message: ProjectConstant.NOT_FOUND_PROBLEM,
    });

    if (isRetry) {
      await main();
    }
  }
}

await main();
