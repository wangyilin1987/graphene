/**
 *  @file
 *  @copyright defined in eos/LICENSE
 */
#include <eosio/base_plugin/base_plugin.hpp>

namespace eosio {
   static appbase::abstract_plugin& _base_plugin = app().register_plugin<base_plugin>();

   using std::vector;

   using fc::time_point;
   using fc::time_point_sec;

   class base_plugin_impl {
   public:
      bool                             done = false;
      void handle_message();
   };

   const fc::string logger_name("base_plugin_impl");
   fc::logger logger;

   base_plugin::base_plugin()
   {
      base_plugin::base_plugin()
         :my( new base_plugin_impl ) {         
      }
   }

   base_plugin::~base_plugin() {
   }

   void base_plugin::set_program_options( options_description& cli, options_description& cfg )
   {

   }

   template<typename T>
   T dejsonify(const string& s) {
      return fc::json::from_string(s).as<T>();
   }

   void base_plugin::plugin_initialize( const variables_map& options ) {
      fc_ilog( logger, "Initialize base_plugin" );

   }

   void base_plugin::plugin_startup() {
      fc_ilog( logger, "plugin_startup base_plugin" );
      if(fc::get_logger_map().find(logger_name) != fc::get_logger_map().end())
         logger = fc::get_logger_map()[logger_name];
   }

   void base_plugin::handle_sighup() {
      fc_ilog( logger, "handle_sighup begin" );
   }

   void base_plugin::plugin_shutdown() {
      fc_ilog( logger, "plugin_shutdown begin" );
   }

namespace base_apis {
   read_only::get_info_results read_only::get_info(const read_only::get_info_params&) const {
      fc_ilog( logger, "get_info begin" );
   }
}//namespace base_apis
}//namespace eosio
