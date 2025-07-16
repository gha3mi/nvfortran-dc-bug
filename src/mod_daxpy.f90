module mod_daxpy
   use, intrinsic :: iso_fortran_env, only: int32, int64
   implicit none
   integer, parameter :: dp = SELECTED_REAL_KIND(15, 307)

   private
   public initialize, do_daxpy_of_size, check_array, dp, int64

contains

   !> author: Seyed Ali Ghasemi
   subroutine initialize(n, alpha, A, B, chunk)
      integer(int64), intent(in) :: n
      real(dp), allocatable, intent(out) :: A(:), B(:)
      real(dp), intent(out) :: alpha
      integer(int64), intent(out) :: chunk
      integer(int64) :: istart, iend, i
      integer :: j

      chunk = int(2_int64**31 - 1)
      print '(a)', ""
      print '(a, i20)', "n           = ", n
      print '(a, i20)', "chunk       = ", chunk
      print '(a, i20)', "huge(int32) = ", huge(0_int32)
      print '(a, i20)', "huge(int64) = ", huge(0_int64)

      ! allocate(A(n), source=1.0_dp)
      ! allocate(B(n), source=0.0_dp)
      allocate(A(n))
      allocate(B(n))
      do istart = 1_int64, n, chunk
         iend = min(n, istart + chunk - 1_int64)
         do concurrent (j=1:int(iend - istart + 1_int64, kind=int32))
            i = istart + int(j - 1, kind=int64)
            A(i) = 1.0_dp
            B(i) = 0.0_dp
         end do
      end do

      alpha = 3.0_dp
   end subroutine

   !> author: Seyed Ali Ghasemi
   subroutine do_daxpy_of_size(n, alpha, A, B, chunk)
      real(dp), allocatable, intent(inout) :: A(:), B(:)
      real(dp), intent(in) :: alpha
      integer(int64), intent(in) :: n
      integer(int64), intent(in) :: chunk
      integer(int64) :: istart, iend, i
      integer :: j

      do istart = 1_int64, n, chunk
         iend = min(n, istart + chunk - 1_int64)
         do concurrent (j=1:int(iend - istart + 1_int64, kind=int32))
            i = istart + int(j - 1, kind=int64)
            B(i) = alpha * A(i) + B(i)
         end do
      end do
   end subroutine

   subroutine check_array(array, expected, tol, n)
      real(dp), intent(in) :: array(:)
      real(dp), intent(in) :: expected, tol
      integer(int64), intent(in) :: n
      integer(int64) :: i

      do i = 1_int64, n
         if (abs(array(i) - expected) > tol) then
            print *, "ERROR: array(", i, ") = ", array(i), " but expected ~", expected
            print *, i, array(i), expected, tol
            stop 1
         end if
      end do
   end subroutine

end module
