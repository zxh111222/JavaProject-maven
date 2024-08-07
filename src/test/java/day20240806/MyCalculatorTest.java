package day20240806;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;


@Disabled
class MyCalculatorTest {

    @Test
    void add() {
        int expected = 5;
        int actual = MyCalculator.add(2, 3);
        assertEquals(expected, actual);
    }
}