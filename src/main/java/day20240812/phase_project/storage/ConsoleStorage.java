package day20240812.phase_project.storage;


import day20240812.phase_project.dto.CustomResult;
import day20240812.phase_project.storage.Storage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author XinhaoZheng
 * @version 1.0
 * @description: TODO
 * @date 2024/6/9 14:14
 */
public class ConsoleStorage implements Storage {
    @Override
    public void save(List<CustomResult> information) {
        for (CustomResult cr : information) {
            System.out.println(cr.getTitle());
            System.out.println(cr.getUrl());
            System.out.println(cr.getCreatedAt());
            System.out.println(cr.getUpdatedAt());
            System.out.println("--- --- ---");
        }
    }
}
