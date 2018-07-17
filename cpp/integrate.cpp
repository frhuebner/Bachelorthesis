#include<iostream>
#include<math.h>
# define M_PI           3.14159265358979323846  /* pi */
using namespace std;

const double BETA = 8*M_PI;
const double START = 0.001;
const double STOP = 5;
const double STEP = 0.001;

const double INTEGRALGTAU = 0.2280175821738063;

double r, aa, bb, bbinv, xi, xi2;

double g(double tau){
	double arg = M_PI/BETA*tau;
	double s = sinh(arg);
	//cout << "\t" << s << endl;
	return (arg*cosh(arg) - s)/(2*s*s*s);
}

double f(double x){
	double s1 = sinh(M_PI/BETA*r*sqrt(xi2*x*x-2+2*cos(x)));
	double s2 = sinh(M_PI/BETA*x*bbinv);
	return (s2*s2-s1*s1)/(s1*s1*s2*s2)/4; 
}

double integrate(){
	double res = f(START)*g(START)/2;	
	for(double x = START;x<STOP;x+=STEP){
		cout << res << "\tadd\t" << f(x)*g(x/bb) << endl;
		res += f(x)*g(x/bb);
	}
	return res*STEP;
}

double integrateg(){
	double res = g(START)*g(START)/2;	
	for(double x = START+STEP;x<STOP;x+=STEP){
		cout << res << endl;
		cout << "\t" << g(x)*g(x) << endl;
		res += g(x)*g(x);
	}
	return res*STEP;
}


double alpha(){
	aa = sqrt(r/(r-1));
	bbinv = r*sqrt(r-1);
	bb = 1/bbinv;
	xi2 = r;
	xi = sqrt(xi2);
	double alpha = -integrate()/bb/INTEGRALGTAU;
	return alpha;
}

int main(){
	r = 110;
	cout << r << "\t" << alpha() << endl;
	/*for(r = 10;r<1000;r+=10){
		cout << r << "\t" << alpha() << endl;
	}*/
	return 0;
}
