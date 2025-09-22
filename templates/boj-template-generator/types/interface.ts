// 언어별 표시명 인터페이스
interface DisplayName {
  language: string;
  name: string;
  short: string;
}

// 별칭 인터페이스
interface Alias {
  alias: string;
}

// 태그 인터페이스
interface Tag {
  key: string;
  isMeta: boolean;
  bojTagId: number;
  problemCount: number;
  displayNames: DisplayName[];
  aliases: Alias[];
}

// 제목 인터페이스
interface Title {
  language: string;
  languageDisplayName: string;
  title: string;
  isOriginal: boolean;
}

// 문제 인터페이스
export interface Problem {
  problemId: number;
  titleKo: string;
  titles: Title[];
  isSolvable: boolean;
  isPartial: boolean;
  acceptedUserCount: number;
  level: number;
  votedUserCount: number;
  sprout: boolean;
  givesNoRating: boolean;
  isLevelLocked: boolean;
  averageTries: number;
  official: boolean;
  tags: Tag[];
  metadata: any;
}
