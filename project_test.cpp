// Test project solution for auto grading on GRADESCOPE

#include<iostream>

using namespace std;

int main()
{
	int numberLength, num; 

	// read the number of numbers from the redirected input file
    cin >> numberLength;
	int* arr1 = new int[numberLength];

	// read the input numbers
	for (int i = 0; i < numberLength; i++)
	{
		cin >> num;
		arr1[i] = num;
	}

	// display the input numbers
	cout << "Input numbers: " << endl;
	for (int i = 0; i < numberLength; i++)
	{
		cout << arr1[i] << " ";
	}
	cout << endl;

	// find the sum
	int total = 0;
	cout << "Sum: ";
	for (int i = 0; i < numberLength; i++)
	{
		total += arr1[i];
	}
	cout << total << endl;
	
	// find the product
	int product = 1;
	cout << "Product: ";
	for (int i = 0; i < numberLength; i++)
	{
		product *= arr1[i] + 1;
	}
	cout << product << endl;

	// find the mean
	cout << "Mean: " << float(total)/float(numberLength) << endl;

    return 0;
}
