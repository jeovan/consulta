ActiveSupport.on_load(:active_record) do
  ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter.class_eval do
    # true and false will be stored as 'Y' and 'N'
    self.emulate_booleans_from_strings = true
 
    # start primary key sequences from 1 (and not 10000) and take just one next value in each session
    self.default_sequence_start_value = "1 NOCACHE INCREMENT BY 1"
 
    # Use old visitor for Oracle 12c database
    self.use_old_oracle_visitor = false
 
    # other settings ...
    # ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter.default_tablespaces =
    # {:clob => 'TSLOBS', :blob => 'TSLOBS', :index => 'TSINDEXES', :table => 'TSTABLES'}
  end
 end
