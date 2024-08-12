package day20240812.phase_project.storage;

import day20240812.phase_project.dto.CustomResult;
import day20240812.phase_project.util.MyReflectionUtil;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface Storage {

    static Storage getInstance(String storage) {
        return MyReflectionUtil.getInstance(storage);
    }

    void save(List<CustomResult> information) throws IOException, SQLException;
}
