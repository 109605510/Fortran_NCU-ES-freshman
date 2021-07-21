Program HW9_earthquake_intensity
implicit none 
    integer i, n
    real t(8000), data(8000), big, small, abig
    character*80 input_file_name
!---------------------------------

    write(*,*)'Input file name:'
    read(*,*)input_file_name      !data.txt

    write(*,*)'Input the amount of points of the file:'
    read(*,*)n

    open(8,file=input_file_name,status='OLD')

    !i=0 
    !10 continue 
    !    i = i+1
    !    read(8,*,end=20) t(i), data(i)
    !    goto 10 
    !20 continue 

    do i=1,n
        read(8,*) t(i), data(i)
    enddo 

                        !最大,最小震幅
    call comparison( n,data,big,small )

    !震幅取絕對值最大
    if ( abs(small) .gt. abs(big) ) then
        big = small
    endif

    write(*,"('PGA =',f8.3,' gal')")big   !Peak Ground Acceleration

    abig = abs(big)   !最大震幅絕對值

    if (0.0.le.abig .and. abig.lt.0.8) then 
        write(*,"('震度 = 0')") 
    elseif(0.8.le.abig .and. abig.lt.2.5) then
        write(*,"('震度 = 1')")
    elseif(2.5.le.abig .and. abig.lt.8.0) then
        write(*,"('震度 = 2')")
    elseif(8.0.le.abig .and. abig.lt.25) then
        write(*,"('震度 = 3')")
    elseif(25.le.abig .and. abig.lt.80) then
        write(*,"('震度 = 4')")
    elseif(80.le.abig .and. abig.lt.250) then
        write(*,"('震度 = 5')")
    elseif(250.le.abig .and. abig.lt.400) then
        write(*,"('震度 = 6')")
    elseif(400.le.big) then
        write(*,"('震度 = 7')")
    endif 

    close(8)

    stop 
    end 



!=================================================
    subroutine comparison( n,a,big,small )

    implicit none 
    integer i, n
    real a(8000)
    real big, small
    !-----------------------------
    big = -1E+06
    small = +1E+06
    do i=1,n
    if ( a(i) .gt. big ) then
        big = a(i)
    endif
    if ( a(i) .lt. small ) then
        small = a(i)
    endif
    enddo

    return
    end subroutine