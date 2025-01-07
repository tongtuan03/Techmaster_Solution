#include <cmath>
#include <vector>

extern "C" {
// Function to solve ax^2 + bx + c = 0
// Returns an array: [numRoots, root1, root2]
double* solveQuadratic(double a, double b, double c) {
    static double result[3];
    if (a == 0) {
        // Not a quadratic equation
        result[0] = -1; // Error
        return result;
    }

    double discriminant = b * b - 4 * a * c;
    if (discriminant < 0) {
        // No real roots
        result[0] = 0;
    } else if (discriminant == 0) {
        // One real root
        result[0] = 1;
        result[1] = -b / (2 * a);
    } else {
        // Two real roots
        result[0] = 2;
        result[1] = (-b + sqrt(discriminant)) / (2 * a);
        result[2] = (-b - sqrt(discriminant)) / (2 * a);
    }
    return result;
}
}
