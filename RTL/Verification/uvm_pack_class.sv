package uvm_pack_class;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    class sequence_item_tb extends uvm_sequence_item;
        `uvm_object_utils(sequence_item_tb)
        function new(string name = "sequence_item_tb");
            super.new(name);
        endfunction //new()

        //---------defining the parameters of the AES----------//
        logic                   start_operation;
        rand logic [127:0]           key_vector;
        rand logic [127:0]           input_vector;
        logic [127:0]           cipher_text;
        logic                   data_valid;

        function void printf (string s_name);
            $display("The shown parameters are in %s",s_name);
        endfunction

        //---------defining constraints for randomized inputs when finishing the verification env.---------//
    endclass //sequence_item_tb extends uvm_sequence_item

    class sequencer_tb extends uvm_sequencer #(sequence_item_tb,sequence_item_tb);
        `uvm_component_utils(sequencer_tb)
        function new(string name = "sequencer_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //sequencer_tb extends uvm_sequencer

    class driver_tb extends uvm_driver #(sequence_item_tb,sequence_item_tb);
        `uvm_component_utils(driver_tb)

        //------virtual interface instance-----------//
        virtual AES_128_interface config_intf_driver;

        //-----sequence item instance-------//
        sequence_item_tb seq_item_in_driver;

        //---------output file generated ID----------//
        int fileID1, fileID2, fileID3;

        function new(string name = "driver_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            if(!uvm_config_db #(virtual AES_128_interface)::get(this,"", "intf_virtual",config_intf_driver))
                `uvm_fatal(get_full_name(),"Error in driver configuration!")

            seq_item_in_driver = sequence_item_tb::type_id::create("seq_item_in_driver");
            $display("build phase of driver is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
           // $display("connect phase in driver is done!");
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
            //--------open files to write down input and key random generated values-------//
            
            fileID1 = $fopen("key_input_vectors.txt","w");
            fileID2 = $fopen("input_vectors_only.txt","w");
            fileID3 = $fopen("key_vectors_only.txt","w");

            forever begin
                seq_item_port.get_next_item(seq_item_in_driver);
                //------we should run two test cases in parallel to set the start only 1 clk cycle-------//
                @(posedge config_intf_driver.clk)
                config_intf_driver.start_operation <= seq_item_in_driver.start_operation;
                config_intf_driver.key_vector <= seq_item_in_driver.key_vector;
                config_intf_driver.input_vector <= seq_item_in_driver.input_vector;
                @(posedge config_intf_driver.clk)
                #1 seq_item_port.item_done();

                //---------write down input and key vectors in hex format-----------//
                $fwrite(fileID1,"Input vector value: %h\n",seq_item_in_driver.input_vector);
                $fwrite(fileID2,"%h\n",seq_item_in_driver.input_vector);

                $fwrite(fileID1,"key vector value: %h\n",seq_item_in_driver.key_vector);
                $fwrite(fileID3,"%h\n",seq_item_in_driver.key_vector);

                $fwrite(fileID1,"\n");

                seq_item_port.get_next_item(seq_item_in_driver);
                @(posedge config_intf_driver.clk)
                config_intf_driver.start_operation <= seq_item_in_driver.start_operation;
                //config_intf_driver.key_vector <= seq_item_in_driver.key_vector;
                //config_intf_driver.input_vector <= seq_item_in_driver.input_vector;
                @(posedge config_intf_driver.data_valid)
                @(posedge config_intf_driver.clk)
                #1 seq_item_port.item_done();
            end
            $fclose(fileID1);
            $fclose(fileID2);
            $fclose(fileID3);
            $display("run phase in driver is done!");
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //driver_tb extends uvm_driver #(sequence_item_tb,sequence_item_tb)

    class monitor_tb extends uvm_monitor ;
        `uvm_component_utils(monitor_tb)

        //sequence_item_tb seq_item_in_monitor;
        //----------virtual interface instance--------//
        virtual AES_128_interface config_intf_monitor;

        //-----------analysis port instantiation-----------//
        uvm_analysis_port #(sequence_item_tb) analysis_port_monitor;

        //--------sequence item instance in monitor----------//
        sequence_item_tb seq_item_in_monitor;

        function new(string name = "monitor_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            if(!uvm_config_db #(virtual AES_128_interface)::get(this,"", "intf_virtual",config_intf_monitor))
                `uvm_fatal(get_full_name(),"Error in monitor configuration!")

            analysis_port_monitor = new("analysis_port_monitor", this); // creation of analysis port
            
            seq_item_in_monitor = sequence_item_tb::type_id::create("seq_item_in_monitor");
            $display("build phase of monitor is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
            forever begin
                @(posedge config_intf_monitor.data_valid)
                @(posedge config_intf_monitor.clk)
                seq_item_in_monitor.cipher_text = config_intf_monitor.cipher_text;
                seq_item_in_monitor.data_valid = config_intf_monitor.data_valid;
                analysis_port_monitor.write(seq_item_in_monitor);
            end
            $display("run phase in monitor is done!");
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //monitor_tb extends uvm_monitor 

    class agent_tb extends uvm_agent;
        `uvm_component_utils(agent_tb)

        //----------monitor, driver and sequencer instances--------//
        sequencer_tb sequencer_in_agent;
        monitor_tb monitor_in_agent;
        driver_tb driver_in_agent;

        //----------interface instance-------------//
        virtual AES_128_interface config_intf_agent;

        //----------analysis port instantiation--------//
        uvm_analysis_port #(sequence_item_tb) analysis_port_agent;

        function new(string name = "agent_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            //---------creating handles for beneath components---------------//
            sequencer_in_agent = sequencer_tb::type_id::create("sequencer_in_agent",this);
            monitor_in_agent = monitor_tb::type_id::create("monitor_in_agent",this);
            driver_in_agent = driver_tb::type_id::create("driver_in_agent",this);

            //-----------connecting the interface to driver-------------//
            if(!uvm_config_db #(virtual AES_128_interface)::get(this,"", "intf_virtual",config_intf_agent))
                `uvm_fatal(get_full_name(),"Error in agent configuration!")
            uvm_config_db #(virtual AES_128_interface)::set(this,"driver_in_agent","intf_virtual",config_intf_agent);
            uvm_config_db #(virtual AES_128_interface)::set(this,"monitor_in_agent","intf_virtual",config_intf_agent);

            analysis_port_agent = new("analysis_port_agent",this);  // creating handle for analysis port
            $display("build phase in agent is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
            monitor_in_agent.analysis_port_monitor.connect(analysis_port_agent);
            driver_in_agent.seq_item_port.connect(sequencer_in_agent.seq_item_export);
            $display("connect phase of agent is done!");
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //agent_tb extends uvm_agent

    class scoreboard_tb extends uvm_scoreboard;
        `uvm_component_utils(scoreboard_tb)

        sequence_item_tb seq_item_in_scoreboard;
        sequence_item_tb seq_item_expected; // this should be connected to reference model

        logic [127:0] reference_cipher_text [0:201]; //this reads from the matlab model output file
        int counter = 0;
        int error_count= 0;

        //------- ports instantiation----------//
        uvm_tlm_analysis_fifo #(sequence_item_tb) analysis_fifo_scoreboard;
        uvm_analysis_export #(sequence_item_tb) analysis_export_scoreboard;

        function new(string name = "scoreboard_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            analysis_fifo_scoreboard = new("analysis_fifo_scoreboard",this);  //creation of analysis fifo
            analysis_export_scoreboard = new("analysis_export_scoreboard",this); // creating analysis export handle

            seq_item_in_scoreboard = sequence_item_tb::type_id::create("seq_item_in_scoreboard");
            seq_item_expected = sequence_item_tb::type_id::create("seq_item_expected");

            $readmemh("../../Modeling/floating point script/ciphered_text_file.txt",reference_cipher_text);
            $display("build phase in scoreboard is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
            analysis_export_scoreboard.connect(analysis_fifo_scoreboard.analysis_export);

            $display("connect phase in scoreboard is done!");
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
            forever begin
                analysis_fifo_scoreboard.get(seq_item_in_scoreboard);
                //perform the comparison here between the hardware output and model output//
                $display("cipher text RTL output: %h",seq_item_in_scoreboard.cipher_text);
                $display("cipher text Model output: %h",reference_cipher_text[counter]);
                $display("data valid output: %d",seq_item_in_scoreboard.data_valid);
                if(seq_item_in_scoreboard.cipher_text != reference_cipher_text[counter]) begin
                    error_count++;
                    `uvm_error("run_phase",$sformatf("camparison faild!"));
                end

                counter++;
            end
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
            `uvm_info("report_phase",$sformatf("total errors occured: %d",error_count),UVM_MEDIUM);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //scoreboard_tb    extends superClass

    class subscriber_tb extends uvm_subscriber #(sequence_item_tb);
        `uvm_component_utils(subscriber_tb)
        sequence_item_tb seq_item_in_subscriber;
        //---------covergroup definition--------------//
        /*covergroup coverage_subscriber; //could use sensitivity list to sample at every posedge of clock
            cover1: coverpoint seq_item_in_subscriber.cipher_text {bins bin1[] = cover1 with(item<200);}
        endgroup*/
        function new(string name = "subscriber_tb", uvm_component parent = null);
            super.new(name,parent);
            //coverage_subscriber = new();
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            //seq_item_in_subscriber = sequence_item_tb::type_id::create("seq_item_in_subscriber");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction

        function void write (sequence_item_tb t);
            t.printf("subscriber");
            seq_item_in_subscriber = t;
        endfunction
    endclass //subscriber_tb extends uvm_subscriber

    class environment_tb extends uvm_env;
        `uvm_component_utils(environment_tb)
        //------------virtual interface instance---------//
        virtual AES_128_interface config_intf_env;

        //--------- agent, scoreboard and subscriber instances in environment----------//
        agent_tb agent_in_env;
        scoreboard_tb scoreboard_in_env;
        subscriber_tb subscriber_in_env;

        function new(string name = "environment_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            //-----creating handle for beneath components----------//
            agent_in_env = agent_tb::type_id::create("agent_in_env",this);
            scoreboard_in_env = scoreboard_tb::type_id::create("scoreboard_in_env",this);
            subscriber_in_env = subscriber_tb::type_id::create("subscriber_in_env",this);

            //---------connecting the virtual interface to the agent---------//
            if(!uvm_config_db #(virtual AES_128_interface)::get(this,"", "intf_virtual",config_intf_env))
                `uvm_fatal(get_full_name(),"Error in environment configuration!")
            uvm_config_db #(virtual AES_128_interface)::set(this,"agent_in_env","intf_virtual",config_intf_env);

            $display("build phase of environment is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
            agent_in_env.analysis_port_agent.connect(scoreboard_in_env.analysis_export_scoreboard);
            agent_in_env.analysis_port_agent.connect(subscriber_in_env.analysis_export);
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //environment_tb extends uvm_environment

    class sequence_tb extends uvm_sequence #(sequence_item_tb, sequence_item_tb);
        `uvm_object_utils(sequence_tb)
        //--------creating instance for sequence item--------//
        sequence_item_tb seq_item_in_sequence;

        function new(string name = "sequence_tb");
            super.new(name);
        endfunction //new()

        task pre_body;
            //-------creating handle for sequnce item---------//
            seq_item_in_sequence = sequence_item_tb::type_id::create("seq_item_in_sequence");
        endtask

        task body;
            for(int i=0; i<200;i++) begin
                //------first test case---------//
                start_item(seq_item_in_sequence);
                void'(seq_item_in_sequence.randomize());
                seq_item_in_sequence.start_operation <= 1'b1;
                finish_item(seq_item_in_sequence);

                //------post first test case---------//
                start_item(seq_item_in_sequence);
                //void'(seq_item_in_sequence.randomize());
                seq_item_in_sequence.start_operation <= 1'b0;
                finish_item(seq_item_in_sequence);
            end
            //------second test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.key_vector = 128'h00000000000000000000000000000000;
            seq_item_in_sequence.input_vector = 128'h00000000000000000000000000000000;
            seq_item_in_sequence.start_operation <= 1'b1;
            finish_item(seq_item_in_sequence);

            //------post second test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.start_operation <= 1'b0;
            finish_item(seq_item_in_sequence);

            //------third test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.key_vector = 128'hffffffffffffffffffffffffffffffff;
            seq_item_in_sequence.input_vector = 128'hffffffffffffffffffffffffffffffff;
            seq_item_in_sequence.start_operation <= 1'b1;
            finish_item(seq_item_in_sequence);

            //------post third test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.start_operation <= 1'b0;
            finish_item(seq_item_in_sequence);
        endtask
    endclass //sequence_tb extends uvm_sequence

    class test_tb extends uvm_test;
        `uvm_component_utils(test_tb)
        //----------virtual interface instance----------//
        virtual AES_128_interface config_intf_test;
        //---------environment instance in test class-----//
        environment_tb env_in_test;

        //----------sequence instance in test class----------//
        sequence_tb sequence_in_test;

        function new(string name= "test_tb", uvm_component parent = null);
            super.new(name, parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            env_in_test = environment_tb::type_id::create("env_in_test",this); // handle creation of env
            sequence_in_test = sequence_tb::type_id::create("sequence_in_test");

            if(!uvm_config_db #(virtual AES_128_interface)::get(this,"", "intf_virtual",config_intf_test))
                `uvm_fatal(get_full_name(),"Error in test configuration!")
            uvm_config_db #(virtual AES_128_interface)::set(this,"env_in_test","intf_virtual",config_intf_test);

            $display("build phase of test is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
            phase.raise_objection(this);
            sequence_in_test.start(env_in_test.agent_in_env.sequencer_in_agent);
            phase.drop_objection(this);
            $display("run phase of test is done!");
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //test_tb extends uvm_test
endpackage