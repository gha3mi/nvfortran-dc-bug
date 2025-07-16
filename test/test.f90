program test
   use mod_daxpy
   use fortime, only: timer
   implicit none
   integer(int64), parameter :: n1 = 1024_int64*1024_int64*1024_int64*1_int64
   integer(int64), parameter :: n2 = 1024_int64*1024_int64*1024_int64*2_int64
   integer(int64), parameter :: n3 = 1024_int64*1024_int64*1024_int64*3_int64
   integer(int64), parameter :: n4 = 1024_int64*1024_int64*1024_int64*4_int64
   real(dp), parameter :: tol = 1.0e-8_dp
   integer(int64) :: chunk
   real(dp), allocatable :: A(:), B(:)
   real(dp) :: alpha

   type(timer) :: t

   print'(a,g0)', "my size is ", n1
   call t%timer_start()
   call initialize(n1, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n1, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n1)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

   print'(a,g0)', "my size is ", n2
   call t%timer_start()
   call initialize(n2, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n2, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n2)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

   print'(a,g0)', "my size is ", n3
   call t%timer_start()
   call initialize(n3, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n3, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n3)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

   print'(a,g0)', "my size is ", n4
   call t%timer_start()
   call initialize(n4, alpha, A, B, chunk)
   call t%timer_stop(message="Initialize  :")
   call t%timer_start()
   call do_daxpy_of_size(n4, alpha, A, B, chunk)
   call t%timer_stop()
   call check_array(B, 3.0_dp, tol, n4)
   call t%timer_start()
   if (allocated(A)) deallocate(A)
   if (allocated(B)) deallocate(B)
   call t%timer_stop(message="Finalize    :")

end program test
