# Makefile for compiling fail.f90 with two different flags

FC = nvfortran 
SRC = fail.f90

# Targets
all: default fail_stdpar

default: $(SRC)
	$(FC) -O3 -o $@ $<

fail_stdpar: $(SRC)
	$(FC) -O3 -stdpar=multicore -o $@ $<

# Check target: runs both executables
check: default fail_stdpar
	@echo "Running no stdpar..."
	@./default
	@echo "Running fail_stdpar..."
	@./fail_stdpar

clean:
	rm -f default fail_stdpar

