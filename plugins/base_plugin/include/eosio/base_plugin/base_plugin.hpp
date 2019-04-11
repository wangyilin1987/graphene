/**
 *  @file
 *  @copyright defined in eos/LICENSE
 */
#pragma once
#include <appbase/application.hpp>

#include <fc/reflect/variant.hpp>

namespace eosio {

namespace base_apis {
struct empty{};

class read_only {
   bool  shorten_abi_errors = true;

public:

   read_only() {};

   using get_info_params = empty;

   struct get_info_results {
      string                  server_version;
      optional<string>        server_version_string;
   };
   get_info_results get_info(const get_info_params&) const; 
};//read_only 

class read_write {
public:
   read_write() {};

};//read_write

}//base_apis

   using namespace appbase;

   /*预留结构体*/
   struct base_struct {
      bool              status = false;
      string            remark;
   };

   class base_plugin : public appbase::plugin<base_plugin>
   {
      public:
        base_plugin();
        virtual ~base_plugin();

        /*配置信赖插件*/
        APPBASE_PLUGIN_REQUIRES((http_client_plugin));

        virtual void set_program_options(options_description& cli, options_description& cfg) override;
        void handle_sighup() override;

        void plugin_initialize(const variables_map& options);
        void plugin_startup();
        void plugin_shutdown();

        base_apis::read_only get_read_only_api() const { return base_apis::read_only(); }
        base_apis::read_write get_read_write_api() { return base_apis::read_write(); }

      private:
        std::unique_ptr<class base_plugin_impl> my;
   };

}

/*FC_REFLECT是FC库中提供反射功能的宏。反射的意义在于了解一个未知的对象，反射是不限编程语言的，通过反射能够获取到对象的成员结构*/
/*为结构体提供序列化成员的能力*/
FC_REFLECT( eosio::base_struct, (status)(remark) )

