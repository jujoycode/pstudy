#!/usr/bin/env bash

import { PromptConstant } from "./constants/PromptConstant.js";
import { initProgram } from "./libs/commander.js";
import { Prompt } from "./libs/prompts.js";

// init
async function main() {
  initProgram();

  await Prompt.number({ message: PromptConstant.Q_PROBLEM_NUMBER });
}

await main();
