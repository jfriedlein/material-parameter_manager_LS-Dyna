c ########################################################################################
      function cm_get_sth(nameX) RESULT(index_pair)
c
      ! @todo Create the "list_name" only once and utilise the "cm_version"
      ! to set up the correct version, however to do the latter we need the value of "cm"
c
      implicit none
c
c
      character(len=16), intent(in) :: nameX
      integer, dimension(2) :: index_pair
      character(len=16), dimension(:,:), allocatable :: list_name ! needs to contains 16 characters (filled by underscores)
      integer :: i, j, n_entries_per_row, n_rows
c
      n_rows = 2 ! first row: "cm", second row: "cma"
      n_entries_per_row = 48
c
      !allocate(index_pair(n_rows))
      allocate(list_name(n_rows,n_entries_per_row))
      list_name='________________'
c
c
c ################################# cm #################################
c
c ############################## Data Pt. 1 ############################
c Elasticity, general settings
c    
c Bulk modulus kappa
      list_name(1,1) ='bulkMod_kappa___'
c Second Lame parameter shearMod_mu
      list_name(1,2) = 'shearMod_mu_____'
c hsv-version
      list_name(1,7) = 'hsv_version_____'
c cm-version
      list_name(1,8) = 'cm_version______'
c
c ############################## Data Pt. 2 ############################
c plasticity and isotropic hardening
c
c Isotropic hardening type hardening_type
      list_name(1,9) = 'hardening_type__'
c Yield stress yieldStress
      list_name(1,10) = 'yieldStress_____'
c Hardening modulus hardMod_K
      list_name(1,11) = 'hardMod_K_______'
c Hardening stress hardStress_R_inf
      list_name(1,12) = 'hardStress_R_inf'
c Exp. hardening modulus hardMod_K_exp
      list_name(1,13) = 'hardMod_K_exp___'
c Exponent for "exp" part
      list_name(1,14) = 'expExponent_b___'
c Exponent for "linear" part
      list_name(1,15) = 'hardExponent_n__'
c ID of load curve
      list_name(1,16) = 'loadCurve_ID____'
c
c ############################## Data Pt. 3 ############################
c kinematic plastic hardening
c
c Kinematic hardening type kin_hard_type
      list_name(1,17) = 'kin_hard_type___'
c Number of back stresses
      list_name(1,18) = 'n_back_stresses_'
c 1. Back stress: k_1
      list_name(1,19) = 'backStr1_K1_____'      
c 1. Back stress: k_2
      list_name(1,20) = 'backStr1_K2_____'   
c 2. Back stress: k_1
      list_name(1,21) = 'backStr2_K1_____'   
c 2. Back stress: k_2
      list_name(1,22) = 'backStr2_K2_____'   
c 3. Back stress: k_1
      list_name(1,23) = 'backStr3_K1_____'   
c 3. Back stress: k_2
      list_name(1,24) = 'backStr3_K2_____'   
c ...
c
c ############################## Data Pt. 4 ############################
c plastic anisotropy
c
c Anisotropic plasticity type
      list_name(1,25) = 'anisotropy______'
c Vector for rolling direction: x-component
      list_name(1,26) = 'rolling_dir_x___'
c Vector for rolling direction: y-component
      list_name(1,27) = 'rolling_dir_y___'
c Vector for rolling direction: z-component
      list_name(1,28) = 'rolling_dir_z___'
c Vector for normal direction: x-component
      list_name(1,29) = 'normal_dir_x____'
c Vector for normal direction: y-component
      list_name(1,30) = 'normal_dir_y____'
c Vector for normal direction: z-component
      list_name(1,31) = 'normal_dir_z____'
c
c ############################## Data Pt. 5 ############################
c damage
c
c damage type
      list_name(1,33) = 'dmg_type_______'
c regularisation parameter
      list_name(1,34) = 'regParam_______'
c penalty parameter
      list_name(1,35) = 'penParam_______'
c non-local type
      list_name(1,36) = 'nonLoc_type____'
c
      list_name(1,37) = 'dmg_fnc________'
c  h_TC for MCR
      list_name(1,38) = 'MCR_hTC________'
c
      list_name(1,39) = '_______________'
c
      list_name(1,40) = '_______________'
c
c
c ################################# cma ################################
c
c ############################## Data Pt. 1 ############################
c anisotropy coefficients
c Hill coefficient "h_11" or Yld91 "a"
      list_name(2,1) = 'aniso_coeff_11__'
c Hill coefficient "h_22" or Yld91 "b"
      list_name(2,2) = 'aniso_coeff_22__'
c Hill coefficient "h_33" or Yld91 "c"
      list_name(2,3) = 'aniso_coeff_33__'
c Hill coefficient "h_12" or Yld91 "h"
      list_name(2,4) = 'aniso_coeff_12__'
c Hill coefficient "h_23" or Yld91 "f"
      list_name(2,5) = 'aniso_coeff_23__'
c Hill coefficient "h_31" or Yld91 "g"
      list_name(2,6) = 'aniso_coeff_31__'
c
c ############################## Data Pt. 2 ############################
c additional anisotropy coefficients
c Hill coefficient "h_11" for stress
      list_name(2,9)  = 'aniso_coeff_11_2'
c Hill coefficient "h_22" for stress
      list_name(2,10) = 'aniso_coeff_22_2'
c Hill coefficient "h_33" for stress
      list_name(2,11) = 'aniso_coeff_33_2'
c Hill coefficient "h_12" for stress
      list_name(2,12) = 'aniso_coeff_12_2'
c Hill coefficient "h_23" for stress
      list_name(2,13) = 'aniso_coeff_23_2'
c Hill coefficient "h_31" for stress
      list_name(2,14) = 'aniso_coeff_31_2'
c
c ############################## Data Pt. 3 ############################
c additional damage parameters
c damage saturation parameter eta1
      list_name(2,17) = 'dmg_prm_eta1___'
c damage saturation parameter eta2
      list_name(2,18) = 'dmg_prm_eta2___'
c damage saturation parameter eta3
      list_name(2,19) = 'dmg_prm_eta3___'
c damage saturation parameter eta4
      list_name(2,20) = 'dmg_prm_eta4___'
c threshold for damage initiation
      list_name(2,21) = 'dmg_threshold__'
c exponent for damage evolution
      list_name(2,22) = 'dmg_exponent___'
c
c
c ######################## retrieve the correct index ##################
c
c Retrieve the index
      do i=1,n_rows
        do j=1,n_entries_per_row
          ! Look for the nameX in the list of names to find the index pair (i,j)
          if ( index(nameX,trim(list_name(i,j))) /= 0 ) then
              index_pair(1) = i
              index_pair(2) = j
              return ! end both loops and return "index_pair"
          elseif ( i == n_rows .AND. j==n_entries_per_row ) then
            write(*,*) "cm_get_sth<< Could not find the nameX:", nameX
            stop
          endif
        enddo
      enddo
c
      end function cm_get_sth
