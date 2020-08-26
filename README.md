# material-parameter_manager_LS-Dyna
A manager for LS-Dyna Fortran to retrieve material parameters by name from the list of parameters cm.


## Usage and setup
Open the file `cm_get_sth.F` and change the names and indices of the variables you store in the material parameters 'cm' (set in the material card).


## GET
To get a value from the material parameters call the function
```fortran
  X = cm_get('X', cm) ! get me the value of 'X' from the material parameters 'cm'
```

## SET
The values of the material parameters are set via the material card, hence no function is available for this task.


## Example
For example, we retrieve the following values:
* First Lame parameter
```fortran
real lame_lambda
lame_lambda = cm_get('lame_lambda_____', cm)
```
* Yield stress
```fortran
real yield_stress
yield_stress = cm_get('yieldStress_____', cm)
```
You only have to ensure that the parameters in the material card (P1, P2, ...) fit to the names and indices set in the file `cm_get_sth.F`.

**@todo** add an example on the usage
**@todo** The underscores fill the character array 'X' to the defined length of 16 (set in the cm_get_sth.F file). Find a way to handle arbitrarily long character arrays, so we don't need the underscores.
