!DEC$ IF .NOT. DEFINED (cm_manager_F)
!DEC$ DEFINE cm_manager_F
! -----------MODULE material parameter manager----------------------------

      module cm_manager
c @todo Rework this docu for material parameters
c Usage
c SETUP:
c Open the file 'hsv_get_sth.F' and change the names, indices and lengths of the variables
c you want to store in the history list 'hsv'. You can store more than 5 quantities,
c however then you cannot store the pairs (hsv_init1) in only the first hsv(1). If you
c use the latter feature, you might have to expand the init to hsv(2).
c SET:
c To set a value call the according subroutine
c     call hsv_set_X(X,'X',hsv)
c = put the value of X as 'X' into the history
c GET:
c To get a value from the history call the function
c     X = hsv_get_X('X', hsv)
c = get me the value of 'X' from the history
c INIT:
c You can store the start indices in hsv(1), so it becomes transparent which entry in
c the history list contains what. For instance,
c hsv(1) = 0902030045 ! actually stored without leading zeros as integer
c CONVENTION:
c first pair: start index of tangent es
c last pair:  start index of deformation gradient
c intermediate pairs: history such as alpha, eps_p, damage
c So for the above example, we now know that
c 'es' starts at position 9
c 'alpha' is at index 2
c 'eps_p' starts at index 3
c 'defoGrad' can be found starting at index 45
    
c @todo Find a way to use the interfaces (still getting the ambiguous error)
      
      !interface hsv_get_X
      !module procedure hsv_get_scalar
      !module procedure hsv_get_symTen2
      !module procedure hsv_get_unsymTen2
      !module procedure hsv_get_6x6
      !end interface
      
      !interface hsv_set_X
      !module procedure hsv_set_scalar
      !module procedure hsv_set_symTen2
      !module procedure hsv_set_unsymTen2
      !module procedure hsv_set_6x6
      !end interface   
      
      contains

!      ------BEGIN FUNCTIONS-------------------------------------
!      ------CENTRAL EXTRACTION OF CM----------------------------
       include './cm_get_sth.F'
                              ! How to remember the argument lists for 'get':
       include './cm_get_X.F' ! get me 'nameX' from 'cm'
       include './cm_merge.F'
      end module cm_manager
!DEC$ ENDIF
