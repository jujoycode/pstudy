#!/usr/bin/env bash
import { program } from 'commander';

// init
function main() {
    const opts = program
        .name('boj-template-generator')
        .description('백준 문제 번호를 기반으로 ps를 위한 파일을 준비합니다.')
        .version('1.0.0')
        .action(() => {
            console.log('Action')
        })
}

main()