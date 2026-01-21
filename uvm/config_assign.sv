/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   top.sv

Description 	: 	Top Module
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/



module top;
  

	// import ram_test_pkg
   
	import ram_test_pkg::*;

	// import the UVM package
	import uvm_pkg::*; 

	// include the uvm_macros.svh
	`include "uvm_macros.svh"


 
  // Within initial block 
     // Call run_test("ram_random_test")
	initial
		begin
			run_test("ram_base_test");
		end

     
endmodule : top

/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:  	tb_defs.sv

Description 	: 	TB Definitions
  
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
  
Author Name		:  Shanthi V A

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

	// Declare the ram_wr_agt_top handle
 	
	ram_wr_agt_top agt_top_h;
        int no_of_agents = 3;
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_env",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	

endclass
	
//-----------------  constructor new method  -------------------//
function ram_env::new(string name="ram_env",uvm_component parent);
	super.new(name,parent);
endfunction

         

 //-----------------  Add UVM build() phase   -------------------//
function void ram_env::build_phase(uvm_phase phase);	
	super.build_phase(phase);
        uvm_config_db #(int)::set(this,"agt_top_h","CONFIG",no_of_agents);
	// Create the instance of ram_wr_agt_top in the build phase
	agt_top_h = ram_wr_agt_top::type_id::create("agt_top_h",this);
endfunction
   


   
  
   
/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_test_pkg.sv

Description 	: 	Dual Port RAM TB package
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/


package ram_test_pkg;

	// import the UVM package
	import uvm_pkg::*; 

	//include the "uvm_macros.svh", "tb_defs.sv","write_xtn.sv", 
	//"ram_wr_agent_config.sv", "ram_wr_driver.sv",
	//"ram_wr_monitor.sv","ram_wr_sequencer.sv", 
	//"ram_wr_agent.sv", "ram_wr_agt_top.sv",
	//include  "ram_test.sv" files
	

	`include "uvm_macros.svh"

	`include "tb_defs.sv"
	`include "write_xtn.sv"
	`include "ram_wr_driver.sv"
	`include "ram_wr_monitor.sv"
	`include "ram_wr_sequencer.sv"
	`include "ram_wr_agent.sv"
	`include "ram_wr_agt_top.sv"
	`include "ram_env.sv"
    `include "ram_test.sv"
endpackage


/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		: 	ram_test.sv

Description 	: 	Test case for Dual port RAM
  
Author Name		: 	Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/
//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_base_test from uvm_test;
class ram_base_test extends uvm_test;

   // Factory Registration
	`uvm_component_utils(ram_base_test)

  
    // Declare the ram_env handle
	ram_env env;   
	//Declare a variable no_of agents of int data type & initialize it to 3
	int no_of_agents = 3;    
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_base_test" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
 endclass
//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function ram_base_test::new(string name = "ram_base_test" , uvm_component parent);
	super.new(name,parent);
endfunction

//-----------------  build() phase method  -------------------//
            
function void ram_base_test::build_phase(uvm_phase phase);
   
    // set the no_of_agents into UVM config DB  "int" 
	uvm_config_db#(int)::set(this,"env.agt_top_h","CONFIG",no_of_agents);

    super.build_phase(phase);
	// create the instance for env
	env = ram_env::type_id::create("env",this);
endfunction

/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   write_xtn.sv

Description		:	Write transaction class for Dual port RAM
  
Author Name		:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend write_xtn from uvm_sequence_item
class write_xtn extends uvm_sequence_item;
  
	// UVM Factory Registration Macro
	`uvm_object_utils(write_xtn)

	//------------------------------------------
	// DATA MEMBERS (Outputs non-rand, inputs rand)
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

	// Standard UVM Methods like constructor,do_compare,do_copy,do_print,post_randomize
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

	 // Add a check for rhs_ using $cast to check that the object types are 
	 // compatible
    if(!$cast(rhs_,rhs))
		begin
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
	// Add a check for rhs_ using $cast to check that the object types are 
	// compatible
    if(!$cast(rhs_,rhs)) 
		begin
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

   
    //              	srting name   		bitstream value     size    radix for printing
    printer.print_field( "data", 			this.data, 	    	64,		 UVM_DEC		);
    printer.print_field( "address", 		this.address, 	    12,		 UVM_DEC		);
    printer.print_field( "write", 			this.write, 	    1'b1,		 UVM_DEC		);
    printer.print_field( "xtn_delay", 		this.xtn_delay,     65,		 UVM_DEC		);
   
    //  	         	   variable name	xtn_type		$bits(variable name) 	variable name.name
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
  
Filename		:  	ram_wr_agt_top.sv

Description 	: 	Write agent top class for Dual port RAM TB
  
Author Name		:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/
//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

   // Extend ram_wr_agt_top from uvm_env;
class ram_wr_agt_top extends uvm_env;

   // Factory Registration
	`uvm_component_utils(ram_wr_agt_top)
	// Declare a variable no_of_agents of int data type to get the configuration
	int no_of_agents;    
   // Declare the dynamic array of agent handles
   	ram_wr_agent agnth[];
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
	extern function new(string name = "ram_wr_agt_top" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass
//-----------------  constructor new method  -------------------//
   // Define Constructor new() function
   	function ram_wr_agt_top::new(string name = "ram_wr_agt_top" , uvm_component parent);
		super.new(name,parent);
	endfunction

    
//-----------------  build() phase method  -------------------//
       	function void ram_wr_agt_top::build_phase(uvm_phase phase);
		//Get the configuration from the config_db "int"
		if(!uvm_config_db #(int)::get(this,"","CONFIG",no_of_agents))
                  `uvm_fatal(get_type_name(),"getting failed,check the settings in agt top")		
     		   super.build_phase(phase);
		// Give the size for the agnth array as equal to no_of_agents
	agnth = new[no_of_agents];
       // Create the instance of ram_wr_agent within foreach loop
		foreach(agnth[i])
		       agnth[i]=ram_wr_agent::type_id::create($sformatf("agnth[%0d]",i),this);
		//set first two agents as active & third agent as passive in to config data base "bit"
		
		for(int i=0;i<2;i++)
		uvm_config_db#(bit)::set(this,$sformatf("agnth[%0d]",i),"bit",1);
		
		uvm_config_db#(bit)::set(this,"agnth[2]","bit",0);
		
	endfunction


//-----------------  run() phase method  -------------------//
       // Print the topology
	task ram_wr_agt_top::run_phase(uvm_phase phase);
		uvm_top.print_topology;
	endtask   
/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:  	ram_wr_agent.sv

Description 	: 	Write agent class for Dual port RAM TB
  
Author Name		:   Shanthi V A

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

 
        
   // Declare handles of ram_wr_monitor,ram_wr_sequencer and ram_wr_driver
	ram_wr_monitor monh;
	ram_wr_sequencer seqrh;
	ram_wr_driver drvh;
	
	//Declare a variable is_active of bit data type to get the configuration
	    bit is_active;
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods :
	extern function new(string name = "ram_wr_agent", uvm_component parent = null);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);

endclass : ram_wr_agent
//-----------------  constructor new method  -------------------//

function ram_wr_agent::new(string name = "ram_wr_agent", uvm_component parent = null);
	super.new(name,parent);
endfunction
     
  
//-----------------  build() phase method  -------------------//


function void ram_wr_agent::build_phase(uvm_phase phase);
	// Call parent build phase
	super.build_phase(phase);
   // get the config object using uvm_config_db bit
    if(!uvm_config_db#(bit)::get(this,"","bit",is_active))
  //    `uvm_fatal("CFG","is_active not found in config DB")
      `uvm_fatal(get_type_name(),"is_active getting failed in agt cls")	
	// Create ram_wr_monitor instance	
	monh=ram_wr_monitor::type_id::create("monh",this);
	// If config parameter is_active ==1 
	// Create instance of driver and sequencer
if(is_active==1)
begin
drvh =ram_wr_driver::type_id::create("drvh",this);
seqrh = ram_wr_sequencer::type_id::create("seqrh",this);
end
	
		
endfunction

      
//-----------------  connect() phase method  -------------------//
//If config parameter is_active==1, 
//connect driver(TLM seq_item_port) and sequencer(TLM seq_item_export)

function void ram_wr_agent::connect_phase(uvm_phase phase);
if (is_active==1)
drvh.seq_item_port.connect(seqrh.seq_item_export);	
endfunction
   

   



/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_driver.sv

Description 	:	Write Driver class for Dual port RAM TB
  
Author Name		:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_wr_driver from uvm driver parameterized by write_xtn
class ram_wr_driver extends uvm_driver #(write_xtn);

   // Factory Registration

	`uvm_component_utils(ram_wr_driver)


	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
     	
	extern function new(string name ="ram_wr_driver",uvm_component parent);
	extern task run_phase(uvm_phase phase);
	
endclass

//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function ram_wr_driver::new(string name ="ram_wr_driver",uvm_component parent);
	super.new(name,parent);
endfunction


//-----------------  run() phase method  -------------------//


task ram_wr_driver::run_phase(uvm_phase phase);
   `uvm_info(get_type_name(), "This is Driver run phase", UVM_MEDIUM)
endtask





/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_monitor.sv

Description 	: 	Write monitor class for Dual Port RAM TB
  
Author Name		:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_monitor from uvm_monitor

class ram_wr_monitor extends uvm_monitor;

  // Factory Registration
	`uvm_component_utils(ram_wr_monitor)
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods :
	extern function new(string name = "ram_wr_monitor", uvm_component parent);
	extern task run_phase(uvm_phase phase);
	
endclass 
//-----------------  constructor new method  -------------------//
function ram_wr_monitor::new(string name = "ram_wr_monitor", uvm_component parent);
	super.new(name,parent);
 endfunction

//-----------------  run() phase method  -------------------//
//Print info message “This is write monitor run_phase” 
task ram_wr_monitor::run_phase(uvm_phase phase);
	`uvm_info(get_type_name(),"THIS IS MONITOR IN RUN",UVM_LOW)   
endtask

/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   ram_wr_sequencer.sv

Description 	:	Write sequencer class for Dual Port RAM TB
  
Author Name		:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_wr_sequencer from uvm_sequencer parameterized by write_xtn
class ram_wr_sequencer extends uvm_sequencer #(write_xtn);

	// Factory registration using `uvm_component_utils
	`uvm_component_utils(ram_wr_sequencer)

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_wr_sequencer",uvm_component parent);
endclass

//-----------------  constructor new method  -------------------//
function ram_wr_sequencer::new(string name="ram_wr_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction


      (Specify +UVM_NO_RELNOTES to turn off this notice)

UVM_INFO @ 0: reporter [RNTST] Running test ram_base_test...
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(59) @ 0: uvm_test_top.env.agt_top_h.agnth[0].drvh [ram_wr_driver] This is Driver run phase
UVM_INFO ../wr_agt_top/ram_wr_monitor.sv(51) @ 0: uvm_test_top.env.agt_top_h.agnth[0].monh [ram_wr_monitor] THIS IS MONITOR IN RUN
UVM_INFO ../wr_agt_top/ram_wr_driver.sv(59) @ 0: uvm_test_top.env.agt_top_h.agnth[1].drvh [ram_wr_driver] This is Driver run phase
UVM_INFO ../wr_agt_top/ram_wr_monitor.sv(51) @ 0: uvm_test_top.env.agt_top_h.agnth[1].monh [ram_wr_monitor] THIS IS MONITOR IN RUN
UVM_INFO ../wr_agt_top/ram_wr_monitor.sv(51) @ 0: uvm_test_top.env.agt_top_h.agnth[2].monh [ram_wr_monitor] THIS IS MONITOR IN RUN
UVM_INFO @ 0: reporter [UVMTOP] UVM testbench topology:
----------------------------------------------------------------
Name                         Type                    Size  Value
----------------------------------------------------------------
uvm_test_top                 ram_base_test           -     @456
  env                        ram_env                 -     @468
    agt_top_h                ram_wr_agt_top          -     @478
      agnth[0]               ram_wr_agent            -     @487
        drvh                 ram_wr_driver           -     @530
          rsp_port           uvm_analysis_port       -     @547
          seq_item_port      uvm_seq_item_pull_port  -     @538
        monh                 ram_wr_monitor          -     @522
        seqrh                ram_wr_sequencer        -     @556
          rsp_export         uvm_analysis_export     -     @564
          seq_item_export    uvm_seq_item_pull_imp   -     @670
          arbitration_queue  array                   0     -
          lock_queue         array                   0     -
          num_last_reqs      integral                32    'd1
          num_last_rsps      integral                32    'd1
      agnth[1]               ram_wr_agent            -     @495
        drvh                 ram_wr_driver           -     @697
          rsp_port           uvm_analysis_port       -     @714
          seq_item_port      uvm_seq_item_pull_port  -     @705
        monh                 ram_wr_monitor          -     @689
        seqrh                ram_wr_sequencer        -     @723
          rsp_export         uvm_analysis_export     -     @731
          seq_item_export    uvm_seq_item_pull_imp   -     @837
          arbitration_queue  array                   0     -
          lock_queue         array                   0     -
          num_last_reqs      integral                32    'd1
          num_last_rsps      integral                32    'd1
      agnth[2]               ram_wr_agent            -     @503
        monh                 ram_wr_monitor          -     @856
----------------------------------------------------------------


--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    7
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[UVMTOP]     1
[ram_wr_driver]     2
[ram_wr_monitor]     3
$finish called from file "/home/cad/eda/SYNOPSYS/VCS/vcs/T-2022.06-SP1/etc/uvm/base/uvm_root.svh", line 437.
$finish at simulation time                    0
           V C S   S i m u l a t i o n   R e p o r t
Time: 0 ps
CPU Time:      0.460 seconds;       Data structure size:   0.5Mb
Wed Jan 21 22:31:14 2026
[PeekeUC@mavenserver-RH2 sim]$

