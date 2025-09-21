#!/usr/bin/env node

import { ProjectConstant } from "./constants/ProjectConstant.js";
import { fetcher } from "./libs/axios.js";
import { initProgram } from "./libs/commander.js";
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
  const bojDocs = await fetcher().get(
    `${ProjectConstant.SOLVED_AC_API_URL.PROBLEM}/show`,
    { params: { problemId: problemNumber } }
  );

  console.log(bojDocs.data);
}

await main();
