program test2
   use, intrinsic :: iso_fortran_env, only: int32, int64
   implicit none

   integer(int64), parameter :: s1 = 10_int64
   integer(int64), parameter :: s2 = 10_int64
   integer(int64), parameter :: n1 = int(huge(int32), kind=int64) + 10_int64
   integer(int64), parameter :: n2 = int(huge(int32), kind=int64) + 11_int64
   integer(int64) :: i

   print'(a)', "Test for loop range within int32"
   print'(a,g0)', "n1          =  ", n1
   print'(a,g0)', "s1          =  ", s1
   print'(a,g0)', "n1 - s1     =  ", n1 - s1
   print'(a,g0)', "huge(int32) =  ", huge(int32)
   do concurrent (i = s1:n1)
      if (i == n1) print*, "ok"
   end do
   print'(a)',    "if n1 - s1  <= huge(int32): ok"

   print*, ""

   print'(a)', "Test for loop range exceeding int32"
   print'(a,g0)', "n2          =  ", n2
   print'(a,g0)', "s2          =  ", s2
   print'(a,g0)', "n2 - s2     =  ", n2 - s2
   print'(a,g0)', "huge(int32) =  ", huge(int32)
   do concurrent (i = s2:n2)
      if (i == n2) print*, "ok"
   end do
   print'(a)',    "if n2 - s2  >  huge(int32): not ok"
end program
