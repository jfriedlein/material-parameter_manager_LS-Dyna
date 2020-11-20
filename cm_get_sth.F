c ########################################################################################
      integer function cm_get_sth(nameX)
c
      implicit none
c
c     @note
c     When you change something, remember to change the length of the arrays ("dimension") as well as
c     the number of characters (len) if needed.
c
      character(len=16), intent(in) :: nameX
      ! !!! When you change the parameters, then you have to update the following TWO dimensions (=nbr of parameters) !!!!
      character(len=16), dimension(16) :: list_name ! needs to contains 16 characters (filled by underscores)
      integer, dimension(16) :: list_index
      integer :: i, counter
c
      counter = 1
c
c ### Data Pt. 1 ###
c    
c 1. Parameter: First Lame parameter lame_lambda
      list_name(counter) = 'lame_lambda_____'
      list_index(counter) = counter
c
      counter = counter +1
c
c 2. Parameter: Second Lame parameter shearMod_mu
      list_name(counter) = 'shearMod_mu_____'
      list_index(counter) = counter
c
      counter = counter +1
c
c 3. Parameter: Hardening modulus hardMod_K
      list_name(counter) = 'hardMod_K_______'
      list_index(counter) = counter
c
      counter = counter +1
c
c 4. Parameter: Yield stress yieldStress
      list_name(counter) = 'yieldStress_____'
      list_index(counter) = counter
c
      counter = counter +1
c
c 5. Parameter: Hardening stress hardStress_R_inf
      list_name(counter) = 'hardStress_R_inf'
      list_index(counter) = counter
c
      counter = counter +1
c
c 6. Parameter: Exp. hardening modulues hardMod_K_exp
      list_name(counter) = 'hardMod_K_exp___'
      list_index(counter) = counter
c
      counter = counter +1
c
c 7. Parameter: finite strain on/off
      list_name(counter) = 'finiteStrain____'
      list_index(counter) = counter
c
      counter = counter +1
c
c 8. Parameter: Hardening type hardening_type
      list_name(counter) = 'hardening_type__'
      list_index(counter) = counter
c
      counter = counter +1
c
c ### Data Pt. 2 ###
c    
c 9. Parameter: Anisotropic plasticity on/off
      list_name(counter) = 'anisotropy______'
      list_index(counter) = counter
c
      counter = counter +1
c
c 10. Parameter: Hill coefficients h11
      list_name(counter) = 'HillCoeff_h11___'
      list_index(counter) = counter
c
      counter = counter +1
c
c 11. Parameter: Hill coefficients h22
      list_name(counter) = 'HillCoeff_h22___'
      list_index(counter) = counter
c
      counter = counter +1
c
c 12. Parameter: Hill coefficients h33
      list_name(counter) = 'HillCoeff_h33___'
      list_index(counter) = counter
c
      counter = counter +1
c
c 13. Parameter: Hill coefficients h12
      list_name(counter) = 'HillCoeff_h12___'
      list_index(counter) = counter
c
      counter = counter +1
c
c 14. Parameter: Hill coefficients h23
      list_name(counter) = 'HillCoeff_h23___'
      list_index(counter) = counter
c
      counter = counter +1
c
c 15. Parameter: Hill coefficients h31
      list_name(counter) = 'HillCoeff_h31___'
      list_index(counter) = counter
c
      counter = counter +1
c
c 16. Parameter: Sheet orientation
      list_name(counter) = 'sheetOrientation'
      list_index(counter) = counter
c
      counter = counter +1
c
c ### Data Pt. 3 ###
c    

c Retrieve the index
      do i=1,maxval(list_index)
          ! Look for the nameX in the list of names to find the index 'i'
          if ( index(nameX,trim(list_name(i))) /= 0 ) then
              cm_get_sth = list_index(i)
              exit
          elseif ( i == maxval(list_index) ) then
              write(*,*) "cm_get_sth<< Could not find the nameX:", nameX
              pause
          endif
      enddo
c
      end function cm_get_sth