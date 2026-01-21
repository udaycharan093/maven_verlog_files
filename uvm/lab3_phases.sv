/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:	ram_pkg.sv

Description		:	TB package for Dual port RAM
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/


package ram_pkg;

	// import the UVM package
         import uvm_pkg::*;

	// include the uvm_macros.svh
	 `include "uvm_macros.svh"
	// include the tb_defs.sv
         `include "tb_defs.sv"
 
	// include ram_wr_driver,ram_wr_agent,ram_env,ram_wr_test files   
	 `include "ram_wr_driver.sv"
         `include "ram_wr_agent.sv"
         `include "ram_env.sv"
         `include "ram_wr_test.sv"
  
	
	

endpackage


/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   top.sv
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

module top;
  
    //import ram_pkg.sv
     import ram_pkg::*;

    // import the UVM package
     import uvm_pkg::*;

    // include the uvm_macros.svh
     `include "uvm_macros.svh"

    //Within initial block call run_test("ram_wr_test")
     initial
              begin
               run_test("ram_wr_test");
              end	

  
endmodule : top

/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   tb_defs.sv

Description 	:	TB Definitions
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

`define RAM_WIDTH 64
`define ADDR_SIZE 12

typedef enum bit { BAD_XTN, GOOD_XTN } addr_t;

/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:	ram_env.sv

Description 	: 	Environment class for Dual Port RAm testbench
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_env from uvm_env
class ram_env extends uvm_env;

   // Factory Registration
	
    `uvm_component_utils(ram_env)		

	// Declare the ram_wr_agent handle
 

        ram_wr_agent wrh;

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_env",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
	extern function void start_of_simulation_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern function void extract_phase(uvm_phase phase);
	extern function void check_phase(uvm_phase phase);
	extern function void report_phase(uvm_phase phase);

endclass
	
//-----------------  constructor new method  -------------------//
function ram_env::new(string name = "ram_env",uvm_component parent);
	super.new(name,parent);
endfunction:new
       


       
  
// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//        Print using `uvm_info("RAM_ENV","This is build phase",UVM_LOW)  in all the phases 
   

 //-----------------  Add UVM build() phase   -------------------//
//Create the instance of ram_wr_agent in build phase
   
function void ram_env:: build_phase(uvm_phase phase);
    //  super.build_phase(phase);
      wrh = ram_wr_agent::type_id::create("wrh",this);
      `uvm_info("RAM_ENV","THIS IS BUILD PHASE", UVM_LOW)
endfunction
  	
//-----------------  Add UVM connect() phase   -------------------//

function void ram_env::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("RAM_ENV","THIS IS CONNECT PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM end_of_elaboration() phase   -------------------//

function void ram_env::end_of_elaboration_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("RAM_ENV","THIS IS END OF ELABORATION PHASE", UVM_LOW)
endfunction


   
//-----------------  Add UVM start_of_simulation() phase   -------------------//

function void ram_env::start_of_simulation_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("RAM_ENV","THIS IS START OF SIMULATION PHASE", UVM_LOW)
endfunction

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising ans dropping the objections add 100 delay in the run phase before printing

task ram_env::run_phase(uvm_phase phase);
   super.run_phase(phase);
   phase.raise_objection(this);
   #100;
   phase.drop_objection(this);
   `uvm_info("RAM_ENV","THIS IS RUN PHASE", UVM_LOW)
endtask

//-----------------  Add UVM extract() phase   -------------------//

function void ram_env::extract_phase(uvm_phase phase);
   super.extract_phase(phase);
   `uvm_info("RAM_ENV","THIS IS EXTRACT PHASE", UVM_LOW)
endfunction



   
//-----------------  Add UVM check() phase   -------------------//


function void ram_env::check_phase(uvm_phase phase);
   super.check_phase(phase);
   `uvm_info("RAM_ENV","THIS IS CHECK PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM report() phase   -------------------//


function void ram_env::report_phase(uvm_phase phase);
   super.report_phase(phase);
   `uvm_info("RAM_ENV","THIS IS REPORT PHASE", UVM_LOW)
endfunction



   
  
   


/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_test.sv

Descrition 		: 	Test class for dual port ram_testbench
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_test from uvm_test
class ram_wr_test extends uvm_test;

   // Factory Registration
    `uvm_component_utils(ram_wr_test)	

   // Declare the ram_env handle
    ram_env envh;

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_wr_test",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
	extern function void start_of_simulation_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern function void extract_phase(uvm_phase phase);
	extern function void check_phase(uvm_phase phase);
	extern function void report_phase(uvm_phase phase);

endclass


//-----------------  constructor new method  -------------------//
function ram_wr_test::new(string name="ram_wr_test", uvm_component parent );
	super.new(name,parent);
endfunction

       
  
// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//        Print using `uvm_info("RAM_WR_TEST","This is build phase",UVM_LOW)  in all the phases 
   

//-----------------  Add UVM build() phase   -------------------//
// Create the instance of ram_env in the build phase
function void ram_wr_test:: build_phase(uvm_phase phase);
    //  super.build_phase(phase);
      envh = ram_env::type_id::create("envh",this);
      `uvm_info("RAM_WR_TEST","THIS IS BUILD PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM connect() phase   -------------------//
function void ram_wr_test::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("RAM_WR_TEST","THIS IS CONNECT PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_wr_test::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      `uvm_info("RAM_WR_TEST","THIS IS END_OF_ELABORATION PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_wr_test::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      `uvm_info("RAM_WR_TEST","THIS IS START_OF_SIMULATION PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising ans dropping the objections add 100 delay in the run phase before printing
task ram_wr_test::run_phase(uvm_phase phase);
   super.run_phase(phase);
   phase.raise_objection(this);
   #100;
   phase.drop_objection(this);
   `uvm_info("RAM_WR_TEST","THIS IS RUN PHASE", UVM_LOW)
endtask


//-----------------  Add UVM extract() phase   -------------------//
function void ram_wr_test::extract_phase(uvm_phase phase);
   super.extract_phase(phase);
   `uvm_info("RAM_WR_TEST","THIS IS EXTRACT PHASE", UVM_LOW)
endfunction
 
 
//-----------------  Add UVM check() phase   -------------------//
function void ram_wr_test::check_phase(uvm_phase phase);
   super.check_phase(phase);
   `uvm_info("RAM_WR_TEST","THIS IS CHECK PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_test::report_phase(uvm_phase phase);
   super.report_phase(phase);
   `uvm_info("RAM_WR_TEST","THIS IS REPORT PHASE", UVM_LOW)
endfunction
   


/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename:       write_xtn.sv
  
Author Name:    Putta Satish

Support e-mail: For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


  // Extend write_xtn from uvm_sequence_item
  class write_xtn extends uvm_sequence_item;
  
// UVM Factory Registration Macro
    	`uvm_object_utils(write_xtn)

//------------------------------------------
// DATA MEMBERS (Outputs rand, inputs non-rand)
//------------------------------------------

 
    
  // Add the rand fields - data (`RAM_WIDTH-1:0), address(`ADDR_SIZE – 1:0),declared in tb_defs.sv
  // write (type bit) 

	rand bit[`RAM_WIDTH-1 : 0] data;    
	rand bit[`ADDR_SIZE-1 : 0] address;
	rand bit write;
  
  // Add the rand control knobs declared in tb_defs.sv

        // xtn_type (enumerated type addr_t)  -  for controlling the type of transaction 
        // xtn_delay (integer type) - for inserting delay between transactions
	
	rand addr_t xtn_type;
	rand bit[63:0] xtn_delay;
         
//------------------------------------------
// CONSTRAINTS
//------------------------------------------
 
  // Add the following constraints :
	// Data between 20 through 90
	// Address between 0 through 200
	// Distribute weights for xtn_type : BAD_XTN=2 and GOOD_XTN=30

	constraint a{ data inside {[20:90]};
		      address inside {[0:200]};
		      xtn_type dist {BAD_XTN:=2 , GOOD_XTN:=30}; 
		    }
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
extern function new(string name = "write_xtn");
extern function void do_copy(uvm_object rhs);
extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
extern function void do_print(uvm_printer printer);
extern function void post_randomize();
endclass:write_xtn

//-----------------  constructor new method  -------------------//
//Add code for new()

	function write_xtn::new(string name = "write_xtn");
		super.new(name);
	endfunction:new
	  
//-----------------  do_copy method  -------------------//
//Add code for do_copy() to copy address, data, write, xtn_type and xtn_delay
  function void write_xtn::do_copy (uvm_object rhs);

    // handle for overriding the variable
    write_xtn rhs_;

    if(!$cast(rhs_,rhs)) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
    end
    super.do_copy(rhs);

  // Copy over data members:
  // <var_name> = rhs_.<var_name>;

    data= rhs_.data;
    address= rhs_.address;
    write= rhs_.write;
    xtn_type= rhs_.xtn_type;
    xtn_delay= rhs_.xtn_delay;

  endfunction:do_copy


//-----------------  do_compare method -------------------//
//Add code for do_compare() to compare address, data, write, xtn_type and xtn_delay
  function bit  write_xtn::do_compare (uvm_object rhs,uvm_comparer comparer);

 // handle for overriding the variable
    write_xtn rhs_;

    if(!$cast(rhs_,rhs)) begin
    `uvm_fatal("do_compare","cast of the rhs object failed")
    return 0;
    end

  // Compare the data members:
  // <var_name> == rhs_.<var_name>;

    return super.do_compare(rhs,comparer) &&
    data== rhs_.data &&
    address== rhs_.address &&
    write== rhs_.write &&
    xtn_type== rhs_.xtn_type &&
    xtn_delay== rhs_.xtn_delay;

 endfunction:do_compare 

//-----------------  do_print method  -------------------//
//Use printer.print_field for integral variables
//Use printer.print_generic for enum variables
   function void  write_xtn::do_print (uvm_printer printer);
    super.do_print(printer);

   
    //                   srting name   		bitstream value     size       radix for printing
    printer.print_field( "data", 		this.data, 	    64,		 UVM_DEC		);
    printer.print_field( "address", 		this.address, 	    12,		 UVM_DEC		);
    printer.print_field( "write", 		this.write, 	    '1,		 UVM_DEC		);
    printer.print_field( "xtn_delay", 		this.xtn_delay,     65,		 UVM_DEC		);
   
    //  	         variable name		xtn_type		$bits(variable name) 	variable name.name
    printer.print_generic( "xtn_type", 		"addr_t",		$bits(xtn_type),		xtn_type.name);

  endfunction:do_print
    

   function void write_xtn::post_randomize();
    if(xtn_type == BAD_XTN)
    begin
      this.address = 6000;
    end
  endfunction : post_randomize
 
   

/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_agent.sv

Description 	: 	Write agent class for Dual port RAM testbench
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_agent from uvm_agent
class ram_wr_agent extends uvm_agent;

   // Factory Registration
   `uvm_component_utils(ram_wr_agent)		
	

	//Declare the ram_wr_driver handle

         ram_wr_driver drvh;


	//------------------------------------------
	// METHODS
	//------------------------------------------

	//Add all the UVM phases
	extern function new(string name = "ram_wr_agent",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
	extern function void start_of_simulation_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern function void extract_phase(uvm_phase phase);
	extern function void check_phase(uvm_phase phase);
	extern function void report_phase(uvm_phase phase);

endclass


//-----------------  constructor new method  -------------------//
function ram_wr_agent::new(string name = "ram_wr_agent",uvm_component parent);
      super.new(name,parent);
endfunction

   
// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//        Print using `uvm_info("RAM_AGENT","This is build phase",UVM_LOW)  in all the phases 
//-----------------  Add UVM build() phase   -------------------//
// In build phase create the instance of driver 


function void ram_wr_agent:: build_phase(uvm_phase phase);
      super.build_phase(phase);
      drvh = ram_wr_driver::type_id::create("drvh",this);
      `uvm_info("RAM_AGENT","THIS IS BUILD PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM connect() phase   -------------------//
  
function void ram_wr_agent::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("RAM_AGENT","THIS IS CONNECT PHASE", UVM_LOW)
endfunction


//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_wr_agent::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      `uvm_info("RAM_AGENT","THIS IS END_OF_ELABORATION PHASE", UVM_LOW)
endfunction


 
//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_wr_agent::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      `uvm_info("RAM_AGENT","THIS IS START_OF_SIMULATION PHASE", UVM_LOW)
endfunction

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising ans dropping the objections add  delay of 100 in the run phase before printing

task ram_wr_agent::run_phase(uvm_phase phase);
   super.run_phase(phase);
   phase.raise_objection(this);
   #100;
   phase.drop_objection(this);
   `uvm_info("RAM_AGENT","THIS IS RUN PHASE", UVM_LOW)
endtask



//-----------------  Add UVM extract() phase   -------------------//

 function void ram_wr_agent::extract_phase(uvm_phase phase);
   super.extract_phase(phase);
   `uvm_info("RAM_AGENT","THIS IS EXTRACT PHASE", UVM_LOW)
endfunction

 

//-----------------  Add UVM check() phase   -------------------//
function void ram_wr_agent::check_phase(uvm_phase phase);
   super.check_phase(phase);
   `uvm_info("RAM_AGENT","THIS IS CHECK PHASE", UVM_LOW)
endfunction

 


//-----------------  Add UVM report() phase   -------------------//


function void ram_wr_agent::report_phase(uvm_phase phase);
   super.report_phase(phase);
   `uvm_info("RAM_AGENT","THIS IS REPORT PHASE", UVM_LOW)
endfunction

 



/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_driver.sv

Description		:	Write Deriver class for Dual Port RAM
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_wr_driver from uvm_driver

class ram_wr_driver extends uvm_driver;

   // Factory Registration
    `uvm_component_utils(ram_wr_driver)	

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Add all the UVM phases:
	extern function new(string name = "ram_wr_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
	extern function void start_of_simulation_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern function void extract_phase(uvm_phase phase);
	extern function void check_phase(uvm_phase phase);
	extern function void report_phase(uvm_phase phase);

endclass


//-----------------  constructor new method  -------------------//
//Add code for new()
function ram_wr_driver::new(string name = "ram_wr_driver",uvm_component parent);
	super.new(name,parent);
endfunction:new


// Add body for all UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
// Hint : `uvm_info(“RAM_DRIVER”,”This is Build Phase ”, UVM_LOW)   

//-----------------  Add UVM build() phase   -------------------//
function void ram_wr_driver::build_phase(uvm_phase phase);
      super.build_phase(phase);
     `uvm_info("RAM_DRIVER","THIS IS BUILD PHASE", UVM_LOW)
endfunction

//-----------------  Add UVM connect() phase   -------------------//
function void ram_wr_driver::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("RAM_DRIVER","THIS IS CONNECT PHASE", UVM_LOW)
endfunction     

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_wr_driver::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      `uvm_info("RAM_DRIVER","THIS IS END_OF_ELABORATION PHASE", UVM_LOW)
endfunction     

//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_wr_driver::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      `uvm_info("RAM_DRIVER","THIS IS START_OF_SIMULATION PHASE", UVM_LOW)
endfunction

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// With in raising and dropping the objections add delay of 10 in the run phase before printing
task ram_wr_driver::run_phase(uvm_phase phase);
   super.run_phase(phase);
   phase.raise_objection(this);
   #10;
   phase.drop_objection(this);
   `uvm_info("RAM_DRIVER","THIS IS RUN PHASE", UVM_LOW)
endtask

//-----------------  Add UVM extract() phase   -------------------//
function void ram_wr_driver::extract_phase(uvm_phase phase);
   super.extract_phase(phase);
   `uvm_info("RAM_DRIVER","THIS IS EXTRACT PHASE", UVM_LOW)
endfunction
   
//-----------------  Add UVM check() phase   -------------------//
function void ram_wr_driver::check_phase(uvm_phase phase);
   super.check_phase(phase);
   `uvm_info("RAM_DRIVER","THIS IS CHECK PHASE", UVM_LOW)
endfunction

//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_driver::report_phase(uvm_phase phase);
   super.report_phase(phase);
   `uvm_info("RAM_DRIVER","THIS IS REPORT PHASE", UVM_LOW)
endfunction



  
   







UVM_INFO @ 0: reporter [RNTST] Running test ram_wr_test...
UVM_INFO ../test/ram_wr_test.sv(72) @ 0: uvm_test_top [RAM_WR_TEST] THIS IS BUILD PHASE
UVM_INFO ../tb/ram_env.sv(78) @ 0: uvm_test_top.envh [RAM_ENV] THIS IS BUILD PHASE
UVM_INFO ../wr_agt_top/ram_wr_agent.sv(74) @ 0: uvm_test_top.envh.wrh [RAM_AGENT] THIS IS BUILD PHASE
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(68) @ 0: uvm_test_top.envh.wrh.drvh [RAM_DRIVER] THIS IS BUILD PHASE
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(74) @ 0: uvm_test_top.envh.wrh.drvh [RAM_DRIVER] THIS IS CONNECT PHASE
UVM_INFO ../wr_agt_top/ram_wr_agent.sv(82) @ 0: uvm_test_top.envh.wrh [RAM_AGENT] THIS IS CONNECT PHASE
UVM_INFO ../tb/ram_env.sv(85) @ 0: uvm_test_top.envh [RAM_ENV] THIS IS CONNECT PHASE
UVM_INFO ../test/ram_wr_test.sv(79) @ 0: uvm_test_top [RAM_WR_TEST] THIS IS CONNECT PHASE
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(80) @ 0: uvm_test_top.envh.wrh.drvh [RAM_DRIVER] THIS IS END_OF_ELABORATION PHASE
UVM_INFO ../wr_agt_top/ram_wr_agent.sv(89) @ 0: uvm_test_top.envh.wrh [RAM_AGENT] THIS IS END_OF_ELABORATION PHASE
UVM_INFO ../tb/ram_env.sv(93) @ 0: uvm_test_top.envh [RAM_ENV] THIS IS END OF ELABORATION PHASE
UVM_INFO ../test/ram_wr_test.sv(86) @ 0: uvm_test_top [RAM_WR_TEST] THIS IS END_OF_ELABORATION PHASE
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(86) @ 0: uvm_test_top.envh.wrh.drvh [RAM_DRIVER] THIS IS START_OF_SIMULATION PHASE
UVM_INFO ../wr_agt_top/ram_wr_agent.sv(97) @ 0: uvm_test_top.envh.wrh [RAM_AGENT] THIS IS START_OF_SIMULATION PHASE
UVM_INFO ../tb/ram_env.sv(102) @ 0: uvm_test_top.envh [RAM_ENV] THIS IS START OF SIMULATION PHASE
UVM_INFO ../test/ram_wr_test.sv(93) @ 0: uvm_test_top [RAM_WR_TEST] THIS IS START_OF_SIMULATION PHASE
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(97) @ 10000: uvm_test_top.envh.wrh.drvh [RAM_DRIVER] THIS IS RUN PHASE
UVM_INFO ../wr_agt_top/ram_wr_agent.sv(109) @ 100000: uvm_test_top.envh.wrh [RAM_AGENT] THIS IS RUN PHASE
UVM_INFO ../tb/ram_env.sv(114) @ 100000: uvm_test_top.envh [RAM_ENV] THIS IS RUN PHASE
UVM_INFO ../test/ram_wr_test.sv(105) @ 100000: uvm_test_top [RAM_WR_TEST] THIS IS RUN PHASE
UVM_INFO /home/cad/eda/SYNOPSYS/VCS/vcs/T-2022.06-SP1/etc/uvm/base/uvm_objection.svh(1274) @ 100000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(103) @ 100000: uvm_test_top.envh.wrh.drvh [RAM_DRIVER] THIS IS EXTRACT PHASE
UVM_INFO ../wr_agt_top/ram_wr_agent.sv(118) @ 100000: uvm_test_top.envh.wrh [RAM_AGENT] THIS IS EXTRACT PHASE
UVM_INFO ../tb/ram_env.sv(121) @ 100000: uvm_test_top.envh [RAM_ENV] THIS IS EXTRACT PHASE
UVM_INFO ../test/ram_wr_test.sv(112) @ 100000: uvm_test_top [RAM_WR_TEST] THIS IS EXTRACT PHASE
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(109) @ 100000: uvm_test_top.envh.wrh.drvh [RAM_DRIVER] THIS IS CHECK PHASE
UVM_INFO ../wr_agt_top/ram_wr_agent.sv(126) @ 100000: uvm_test_top.envh.wrh [RAM_AGENT] THIS IS CHECK PHASE
UVM_INFO ../tb/ram_env.sv(132) @ 100000: uvm_test_top.envh [RAM_ENV] THIS IS CHECK PHASE

UVM_INFO ../test/ram_wr_test.sv(126) @ 100000: uvm_test_top [RAM_WR_TEST] THIS IS REPORT PHASE

--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :   34
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RAM_AGENT]     8
[RAM_DRIVER]     8
[RAM_ENV]     8
[RAM_WR_TEST]     8
[RNTST]     1
[TEST_DONE]     1
$finish called from file "/home/cad/eda/SYNOPSYS/VCS/vcs/T-2022.06-SP1/etc/uvm/base/uvm_root.svh", line 437.
$finish at simulation time               100000
           V C S   S i m u l a t i o n   R e p o r t
Time: 100000 ps
CPU Time:      0.430 seconds;       Data structure size:   0.5Mb
Wed Jan 21 22:20:59 2026
                                                           
