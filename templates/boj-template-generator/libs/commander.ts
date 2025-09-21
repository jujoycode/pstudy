import { Command } from "commander";

/**
 * initProgram
 * @desc 프로그램 정보 반환
 */
export function initProgram() {
  const program = new Command()
    .name("boj-template-generator")
    .description("백준 문제 번호를 기반으로 ps를 위한 파일을 준비합니다.")
    .version("1.0.0")
    .parse(process.argv);

  return program;
}
