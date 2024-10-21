// forward Euler method to solve ODE

#include <stdio.h>
#include <math.h>

// ODE right hand side function
double f(double t, double y)
{
    return (y + t * t - 2.0) / (t + 1);
}

// Euler step
double euler(double y, double t, double h)
{
    return y + f(t, y) * h;
}

// Exact solution
double yexact(double t)
{
    return t * t + 2.0 * t + 2.0 - 2.0 * (t + 1.0) * log(t + 1.0);
}

int main()
{
    // step size
    double h = .2;

    // initial condition
    double t = 0.0;
    double y = 2.0;

    // final time
    double T = 5.0;

    // write step
    int write = 1;

    // no of time steps
    int N = (int)((T - t)/ h) + 1;

    // open file to write data
    FILE *file = fopen("output.dat", "w");

    // file header
    fprintf(file, "%6s %15s %15s %15s %20s\n", "t", "yh(t)", "Y(t)", "Error", "Relative Error");

    // time loop
    for (int i = 0; i < N; i++)
    {
        if (i % write == 0)
        {
            // compute error
            double y_exact = yexact(t);
            double error = fabs(y - y_exact);
            double relative_error = error / y_exact;

            fprintf(file, "%6.3f %15.4e %15.4e %15.2e %20.4f\n", t, y, y_exact, error, relative_error);
        }

        // update y
        y = euler(y, t, h);
        t += h;
    }

    fclose(file);

    return 0;
}