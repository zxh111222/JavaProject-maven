package day20240812.phase_project.downloader;


import day20240812.phase_project.util.MyReflectionUtil;

import java.io.IOException;

public interface Downloader {

    static Downloader getInstance(String downloader) {
        return MyReflectionUtil.getInstance(downloader);
    }

    String download(String url) throws IOException;

}
