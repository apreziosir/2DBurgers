
#  Output file name
   EXC = Toni.out
# 
# loading routines to compile. 
#  OPTIONS here.   
#

# Se remueve la rutina error.o de la lista de rutinas que utiliza el programa
# error.o se encontraba despues de patching.o y antes de interavg2d.o (APR)
# Agregado readBvel.o antes de diffx.o (de acuerdo con orden de main)

USE_INCL= scrotum.o mound.o geom.o legendre.o map.o aetas.o\
	  main.o readdata.o gll.o derv.o mapping.o\
	  ex2dbur.o output2.o velocity.o timestep.o readBvel.o\
	  diffx.o diffz.o spamer.o BCPen.o patchpen.o BDAB.o\
	  setdelta.o initburgers.o CFL.o\
	  BCrhs.o solve_gmres.o lhs_gmres.o allmixed.o\
	  BC.o patching.o interavg2d.o quad.o localFil.o filtering.o 
	      

FC = f95

FFLAGS = -O3 -fdefault-real-8
	 	


#  Compile

$(EXC): $(USE_INCL)
		$(FC) $(FFLAGS) $(USE_INCL) -o $@

$(USE_INCL):	$(INCLUDES)

.f.o:
		$(FC) $(FFLAGS) -c $*.f

clean:
		rm -f core $(EXC) $(USE_INCL) *.mod
		echo Clean Done
