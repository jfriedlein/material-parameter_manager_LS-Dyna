!DEC$ IF .NOT. DEFINED (cm_manager_F)
!DEC$ DEFINE cm_manager_F
! -----------MODULE material parameter manager----------------------------

      module cm_manager
c @todo Rework this docu for material parameters
      contains

!      ------BEGIN FUNCTIONS-------------------------------------
!      ------CENTRAL EXTRACTION OF CM----------------------------
       include './char2int.F'
       include './cm_get_sth.F'
       include './cm_get_sth_V00.F'
       include './cm_get_sth_V01.F'
                              ! How to remember the argument lists for 'get':
       include './cm_get_X.F' ! get me 'nameX' from 'cm'
       include './cm_merge.F'
      end module cm_manager
!DEC$ ENDIF
