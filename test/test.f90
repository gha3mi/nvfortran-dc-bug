program test
   use mod_daxpy
   use fortime, only: timer
   implicit none
   integer(int64), parameter :: n = 1024_int64*1024_int64*1024_int64
   real(dp), parameter :: tol = 1.0e-8_dp
   integer(int64) :: chunk
   real(dp), allocatable :: A(:), B(:)
   real(dp) :: alpha

   type(timer) :: t

   call t%timer_start()
   call initialize(n, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

   call t%timer_start()
   call initialize(n*2_int64, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n*2_int64, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n*2_int64)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

   call t%timer_start()
   call initialize(n*3_int64, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n*3_int64, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n*3_int64)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

   call t%timer_start()
   call initialize(n*4_int64, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n*4_int64, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n*4_int64)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

end program test
