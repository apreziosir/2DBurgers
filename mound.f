	MODULE mound
! 	----------------------------------
! 	This module containd the physical
! 	parameters of the simulation
! 	
! 	Jorge Escobar-Vargas
! 	Cornell University - CEE
! 	February 2008
! 	----------------------------------
	implicit none
	save
	
! 	1. Viscosity (unidades cgs)
!	real, parameter :: nu = 4.2133 !8.8936 (original)
	real, parameter :: nu = 0.01419

! 	2. Gravity (unidades cgs)
	real, parameter :: g = 981
	
! 	3. Averaged Depth
	real, parameter :: H = 20
	
!       4. Initial velocity in x
        real, parameter :: vi_x = 0 !6.44 !0.

!       5. Initial velocity in z
        real, parameter :: vi_z = 0.0
	
	END MODULE mound
