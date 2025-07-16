program main 
use, intrinsic :: iso_fortran_env, only: int64
implicit none 
integer, parameter :: dp = SELECTED_REAL_KIND(15, 307)
integer(int64) :: i
integer(int64), parameter :: n1 = 1024_int64*1024_int64*1024_int64*1_int64
integer(int64), parameter :: n2 = 1024_int64*1024_int64*1024_int64*2_int64
integer(int64), parameter :: n3 = 1024_int64*1024_int64*1024_int64*3_int64
integer(int64), parameter :: n4 = 1024_int64*1024_int64*1024_int64*4_int64

call do_daxpy_of_size(n1)
call do_daxpy_of_size(n2)
call do_daxpy_of_size(n3)
call do_daxpy_of_size(n4)

contains 

subroutine do_daxpy_of_size(n)
use, intrinsic :: iso_fortran_env, only: int64
real(dp), parameter :: tol = 1.0e-8_dp
real(dp), allocatable :: A(:), B(:)
real(dp) :: alpha
integer(int64), intent(in) :: n 

print *, " my size is ", n
allocate(A(n), B(n))
do concurrent (i=1:n)
A(i) = 1.0_dp
B(i) = 0.0_dp
end do
alpha = 3.0_dp
do concurrent (i=1:n)
  B(i) = alpha * A(i) + B(i)
end do 
call check_array(B, 3.0_dp, tol, n)
deallocate(A,B)

end subroutine do_daxpy_of_size

subroutine check_array(array, expected, tol, n)
use, intrinsic :: iso_fortran_env, only: int64
  implicit none
  real(dp), intent(in) :: array(:)
  real(dp), intent(in) :: expected, tol
  integer(int64), intent(in) :: n 
  integer(int64) :: i

  do i = 1, n
    if (abs(array(i) - expected) > tol) then
      print *, "ERROR: array(", i, ") = ", array(i), " but expected ~", expected
      stop 1
    end if
  end do

end subroutine check_array


end program main
