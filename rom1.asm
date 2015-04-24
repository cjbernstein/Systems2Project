.Code
;;ROM 1. A process that will print a few messages and run
__start:

;;print start message to the console
    COPY    %G0  *+_print_sysc_code
    COPY    %G1    +_string_start_rom1_msg
    SYSC

    
;;Add some numbers  
    ADD     %G5     *+_x    *+_y ; at this point, %G5 = 12. Check that this works
    
;;Do some stuff -  multiply 5 times
    COPY    %G4     1; %G4 = counter 
    COPY    %G5   1 ;%G5 = running total(2 to the %G4)
    
_power_of_2_loop_top:
    ;; End the search when the running sum == 10
    BEQ    +_power_of_2_loop_end     %G4  *+_end_of_loop   
    MULUS     %G5     %G5     2
    JUMP    +_power_of_2_loop_top
    
    ;;at this point, %G5 should hold 32
_power_of_2_loop_end:
    ;;print end message to the console
    COPY    %G0  *+_print_sysc_code
    COPY    %G1    +_string_exit_rom1_msg
    SYSC
    ;;;exit
    COPY    %G0    *+_exit_sysc_code
    SYSC

.Numeric
;; The source values to be added.
_x: 4
_y: 12
_end_of_loop: 5

;;SYSC codes
_exit_sysc_code: 1
_create_sysc_code: 2 
_get_rom_count_sysc_code: 3
_print_sysc_code: 4

.Text                                                                             
_string_start_rom1_msg: "rom 1 has started\n"
_string_exit_rom1_msg: "rom 1 ended\n"