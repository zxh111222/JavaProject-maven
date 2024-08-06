package day20240806;

/**
 * @author XinhaoZheng
 * @version 1.0
 * @description: TODO
 * @date 2024/8/6 11:23
 */
public class StudentTest {
    public static void main(String[] args) {
        Student student1 = new Student();
        student1.setAge(18);
        student1.setNewName("nb");
        Student student2 = new Student("xxx", 19);
        System.out.println(student2.getAge());
        System.out.println(student2.getNewName());
    }
}
