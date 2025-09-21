import { Axios } from "axios";
import { ProjectConstant } from "../constants/ProjectConstant.js";

const AxiosInstance = new Axios({
  baseURL: ProjectConstant.SOLVED_AC_API_URL.BASE_URL,
});

export function fetcher() {
  return AxiosInstance;
}
