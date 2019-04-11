/**
 *  @file
 *  @copyright defined in eos/LICENSE
 */
#include <eosio/net_plugin/net_plugin.hpp>

#include <fc/network/message_buffer.hpp>
#include <fc/network/ip.hpp>
#include <fc/io/json.hpp>
#include <fc/io/raw.hpp>
#include <fc/log/appender.hpp>
#include <fc/reflect/variant.hpp>
#include <fc/crypto/rand.hpp>
#include <fc/exception/exception.hpp>

#include <boost/asio/ip/tcp.hpp>
#include <boost/asio/ip/host_name.hpp>
#include <boost/asio/steady_timer.hpp>


namespace fc {
   extern std::unordered_map<std::string,logger>& get_logger_map();
}

namespace eosio {
   static appbase::abstract_plugin& _net_plugin = app().register_plugin<net_plugin>();

   using std::vector;

   using boost::asio::ip::tcp;
   using boost::asio::ip::address_v4;
   using boost::asio::ip::host_name;
   using boost::multi_index_container;

   using fc::time_point;
   using fc::time_point_sec;



   using socket_ptr = std::shared_ptr<tcp::socket>;
   using io_work_t = boost::asio::executor_work_guard<boost::asio::io_context::executor_type>;

 
   net_plugin::net_plugin()
   {
      
   }

   net_plugin::~net_plugin() {
   }

   void net_plugin::set_program_options( options_description& /*cli*/, options_description& cfg )
   {

   }

   template<typename T>
   T dejsonify(const string& s) {
      return fc::json::from_string(s).as<T>();
   }

   void net_plugin::plugin_initialize( const variables_map& options ) {
      

   }

   void net_plugin::plugin_startup() {
 
   }

   void net_plugin::handle_sighup() {
      
   }

   void net_plugin::plugin_shutdown() {
    
   }

}
