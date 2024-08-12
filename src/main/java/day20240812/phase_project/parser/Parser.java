package day20240812.phase_project.parser;

import day20240812.phase_project.dto.CustomResult;
import day20240812.phase_project.util.MyReflectionUtil;

import java.util.List;

public interface Parser {

    static Parser getInstance(String parser) { return MyReflectionUtil.getInstance(parser);}

    List<CustomResult> parse(String html);

}
