	subroutine output2(fn,u,w,erru,errw)
! 	----------------------------------------------------
! 	This subroutine writes data on output files for the
! 	2D Numerical solution of the Shallow Water equations
! 	via Collocation Multidomain Penalty method.

! 	Jorge Escobar-Vargas
! 	Cornell University
! 	February 2008
! 	----------------------------------------------------
! 	MODULES
	USE scrotum
	USE map

	implicit none
! 	Dummy arguments
	real, dimension(nsg), intent(in) :: u, w, erru, errw
	integer, intent (in) :: fn
! 	Local Variables
	integer :: i,j,k,l,jol
	real :: c1,c2,c3,c4,c5,c6,c7
	character (LEN=32) :: fout
	character (LEN=9 ) :: fmt2
	character (LEN=9 ) :: fspec

	fmt2='(i4.4,a4)'
	fspec = 'ZBurgers_'
        fout = fspec

!	Cambiamos de .dat a .csv:
!	write(unit=fout(10:23),fmt=fmt2) fn,'.dat'
	write(unit=fout(10:23),fmt=fmt2) fn,'.csv'

	open(fn,file=fout)
! 	open( fn, file='BurgersOneVar.dat')

!       Estos encabezados eran para que los resultados los lyera tecplot
!       Nosotros usamos ParaView y tenemos algunos problemas de compatibilidad
!       con el formato de TecPlot. Por tal motivo, almacenaremos esto como un
!       csv que pueda ser leido facilmente por paraview

!	write(fn,*) 'TITLE = "2D Burgers Equation"'
!	write(fn,*) 'VARIABLES = "X" "Z" "u" "w"'
	write(fn,*) 'X(cm), Y(cm), Z(cm), u(cm/s), w(cm/s)'
!	write(fn,*) ' ZONE F=POINT, I=', n*nsubx ,', J= ', n*nsubz

! 	This is just to plot the results in tecplot
!       There is no tecplot anymore. Results are shown in X,Z,u,v
!       format to be read in ParaView as a table and transformed
!       to an x, y plane with values associated in every point

	do k = 0,nsubz-1
	  do l = 0,n-1
	    do j = 0,nsubx-1
	      do i = 1, n

		 jol = ns*(k*nsubx) + (l*n) + (j*ns) + i

	        	c1 = cx(jol)
			c2 = cz(jol)
			c3 = u(jol)
			c4 = w(jol)
!			c5 = u(jol) ** 2
!			c6 = w(jol) ** 2
!			c7 = u(jol) * w(jol)
!			c6 = errw(jol)

!       Se dejan de escribir los errores proque aca no se necesitan
!       Se pone un 0 como coordenada del eje y para que Paraview lo
!       agarre.
		write(fn,'(150(F14.8,:,","))') c1, 0., c2, c3, c4
! write(Buf,'(999(G21.6,:,","))')array or data structure
!               write(*,*) jol
	      enddo
	    enddo
	  enddo
	enddo
	close(fn)

	end subroutine output2
