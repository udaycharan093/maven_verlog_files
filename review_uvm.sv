/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   write_xtn.sv

Description		:	Write transaction class for Dual port RAM
  
Author Name		:   Putta Satish

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
	rand bit [`RAM_WIDTH-1:0] data;
	rand bit [`ADDR_SIZE-1:0] address;
	rand bit write;
	
  
	// Add the rand control knobs declared in tb_defs.sv

	// xtn_type (enumerated type addr_t)  -  for controlling the type of transaction 
	// xtn_delay (integer type) - for inserting delay between transactions
	rand addr_t xtn_type;
	rand int xtn_delay;
	
         
	//------------------------------------------
	// CONSTRAINTS
	//------------------------------------------
	 
	// Add the following constraints :
	// Data between 20 through 90
	// Address between 0 through 200
	// Distribute weights for xtn_type : BAD_XTN=2 and GOOD_XTN=30
	constraint c1{data inside {[20:90]};}
	constraint c2{address inside {[0:200]};}
	constraint c3{xtn_type dist{BAD_XTN:=2, GOOD_XTN:=30};}

	
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
	function write_xtn :: new (string name = "write_xtn");
		super.new(name);
	endfunction

	  
//-----------------  do_copy method  -------------------//
//Add code for do_copy() to copy address, data, write, xtn_type and xtn_delay
function void write_xtn::do_copy (uvm_object rhs);

    // handle for overriding the variable
    write_xtn rhs_;

	 // Add a check for rhs_ using $cast to check that the object types are 
	 // compatible
    	if(!$cast(rhs_,rhs))
		begin
			`uvm_fatal("do_copy","cast of rhs failed")
		end

	// Copy over data members:
	// <var_name> = rhs_.<var_name>;
	super.do_copy(rhs);
	this.data = rhs_.data;
	this.address = rhs_.address;
	this.write = rhs_.write;    

        this.xtn_type = rhs_.xtn_type;
	this.xtn_delay = rhs_.xtn_delay;


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
			`uvm_error("do_compare","cast of rhs object failed")
		end
	return

	// Compare the data members and return the result of comparision
	// <var_name> == rhs_.<var_name>;
	super.do_compare(rhs,comparer) && 
	this.data == rhs_.data &&
	this.address == rhs_.address &&
	this.write == rhs_.write && 
	
	this.xtn_type == rhs_.xtn_type &&
	this.xtn_delay == rhs_.xtn_delay;

endfunction:do_compare 

//-----------------  do_print method  -------------------//
//underastand the do_print method implemented below
//Use printer.print_field for integral variables
//Use printer.print_generic for enum variables
function void  write_xtn::do_print (uvm_printer printer);
	super.do_print(printer);

   
    //    srting name   	                bitstream value     size         radix for printing
    printer.print_field( "data", 		this.data, 	    64,		 UVM_DEC		);
    printer.print_field( "address", 		this.address, 	    12,		 UVM_DEC		);
    printer.print_field( "write", 		this.write, 	    1'b1,	 UVM_DEC		);
    printer.print_field( "xtn_delay", 		this.xtn_delay,     65,		 UVM_DEC		);
   
    //  variable name	   xtn_type		$bits(variable name) 	variable name.name
    printer.print_generic( "xtn_type", 		"addr_t",		$bits(xtn_type),		xtn_type.name);

endfunction:do_print
    
// In post_andomize method assign address to 6000 if xtn_type is BAD_XTN
function void write_xtn :: post_randomize();
 if(xtn_type == BAD_XTN)
	begin 
		this.address = 6000;
	end
endfunction:post_randomize
 
   

/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   write_xtn_macros.sv

Description		:	Write transaction class for Dual port RAM
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend write_xtn from uvm_sequence_item
class write_xtn extends uvm_sequence_item;



	//------------------------------------------
	// DATA MEMBERS (Outputs non rand, inputs rand)
	//------------------------------------------

	// Add the rand fields - data (`RAM_WIDTH-1:0), address(`ADDR_SIZE – 1:0),declared in tb_defs.sv
	// write (type bit) 
	rand bit [`RAM_WIDTH-1:0] data;
	rand bit [`ADDR_SIZE-1:0] address;
	bit write;
	
  
	// Add the rand control knobs declared in tb_defs.sv

    // xtn_type (enumerated type addr_t)  -  for controlling the type of transaction 
	// xtn_delay (integer type) - for inserting delay between transactions
	rand addr_t xtn_type;
	rand bit [63:0] xtn_delay;

  
	// Factory registration and use macros for all the fields
	`uvm_object_utils_begin(write_xtn)
		`uvm_field_int(data,UVM_ALL_ON)
		`uvm_field_int(address,UVM_ALL_ON)
		`uvm_field_int(write,UVM_ALL_ON)
		`uvm_field_enum(addr_t,xtn_type,UVM_ALL_ON)
		`uvm_field_int(xtn_delay,UVM_ALL_ON)
	`uvm_object_utils_end


	//------------------------------------------
	// CONSTRAINTS
	//------------------------------------------
	 
	// Add the following constraints :
	// Data between 20 through 90
	// Address between 0 through 200
	// Distribute weights for xtn_type : BAD_XTN=2 and GOOD_XTN=30
	constraint d1{data inside {[20:90]};}
	constraint d2{address inside {[0:200]};}
	constraint d3{xtn_type dist{BAD_XTN:=2, GOOD_XTN:=30};}


	
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods like constructor,post_randomize
	extern function new(string name = "write_xtn");
	extern function void post_randomize();
endclass:write_xtn

//-----------------  constructor new method  -------------------//
//Add code for new()
	function write_xtn :: new (string name = "write_xtn");
		super.new(name);
	endfunction
	  
// In post_andomize method assign address to 6000 if xtn_type is BAD_XTN
function void write_xtn :: post_randomize();
 if(xtn_type == BAD_XTN)
	begin 
		this.address = 6000;
	end
endfunction:post_randomize

 
/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   top.sv

Description		:	Top Module 
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/


module top;
  	import uvm_pkg::*;
	
  
	//import ram_pkg
       	 import ram_pkg::*;

	// Declare two handles of write_xtn class wr_copy_xtnh and wr_clone_xtnh 
	write_xtn wr_copy_xtnh, wr_clone_xtnh;
       
   

 	// Declare dynamic array of handles for write_xtn as wr_xtnh
	write_xtn wr_xtnh[];
	//int x;
	// Declare a variable no_trans as int data type and initialize it with value 10.
 	int no_trans = 10;
        
	// Within initial block
 	initial
		begin

		// Allocate the size of above declared array equal to 10
		wr_xtnh = new[no_trans]; 
		 
		// Within for loop, Generate ten random transactions	
		// Create 10 tr class objects with different strings using $sformatf 
		// randomize & print the 10 transaction class objects
		for(int i = 0; i<no_trans; i++)
		    begin
			wr_xtnh[i] = write_xtn::type_id::create($sformatf("wr_xtnh[%0d]",i));
      			assert(wr_xtnh[i].randomize());
			wr_xtnh[i].print(uvm_default_table_printer);
		    end
			  
	  
		// Copy the 5th transaction item into the 3rd transaction item using copy method 
		wr_xtnh[2].copy(wr_xtnh[4]);
		wr_xtnh[2].print(uvm_default_tree_printer);
		// Copy the 3rd transaction item into another item(wr_copy_xtnh) using copy method
		// Note : Do create an instance for wr_copy_xtnh
		wr_copy_xtnh = write_xtn::type_id::create("wr_copy_xtnh");
		wr_copy_xtnh.copy(wr_xtnh[2]);		

		//Print the object wr_copy_xtnh in a tree format
		wr_copy_xtnh.print(uvm_default_tree_printer);

		// Call Compare method on the 5th and 3rd transaction items
		
		wr_xtnh[2].compare(wr_xtnh[4]);
		if(wr_xtnh[2].compare(wr_xtnh[4]))
			$display("True");
			else $display("False");
		

		//$display("x is = %0d",x);

		// Using clone() method copy the 8th item to another item(wr_clone_xtnh)
		
	//	wr_clone_xtnh = write_xtn::type_id::create("wr_clone_xtnh");
		
		// Note : Do not create an instance for wr_clone_xtnh
		$cast(wr_clone_xtnh, wr_xtnh[7].clone());

		
		//Print the object wr_clone_xtnh in a line format
	
		wr_clone_xtnh.print(uvm_default_line_printer);

		end 


endmodule : top


/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   short_xtn.sv

Description 	:	Extended class of write_xtn.sv
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/
//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend short_xtn from write_xtn
class short_xtn extends write_xtn;

	// UVM Factory Registration Macro
    	`uvm_object_utils(short_xtn)


	//------------------------------------------
	// CONSTRAINTS
	//------------------------------------------

	 // Override Constraint for address such that it generates address to  
	 // access only the first 16 locations of the memory
  	constraint addr_c{address inside{[0:15]};}
	

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Add constructor
	extern function new(string name = "short_xtn");
endclass

//-----------------  constructor new method  -------------------//
//Add code for new()


 function short_xtn::new(string name = "short_xtn");
	super.new(name);
endfunction : new


  
   


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

	import uvm_pkg::*;

	// import the  ram_pkg
    
	import ram_pkg::*;
        
	// Declare handle for write_xtn as wr_xtnh	
	write_xtn wr_xtnh;
	
	// Add build method
	function void build();
		  // Create an instance of wr_xtnh using factory create()
		  wr_xtnh = write_xtn::type_id::create("wr_xtnh");
		  
		// Randomize and print the transactions
		assert(wr_xtnh.randomize());
		wr_xtnh.print();
		  
	endfunction
  
	// Within initial 

	initial
	    begin
		repeat(5) // Call build function 5 times (Without Overriding)
        	build();
		//call factory overriding method
		//Hint : Use factory.set_type_override_by_type Override 
		factory.set_type_override_by_type(write_xtn::get_type(), short_xtn::get_type(),0);

		repeat(5)

		// Call build function 5 times 
        	build();
			factory.set_type_override_by_type(write_xtn::get_type(), short_xtn::get_type(),1);

		repeat(5)

		// Call build function 5 times 
        	build();
			
	
                        
      	end
 
endmodule

  
