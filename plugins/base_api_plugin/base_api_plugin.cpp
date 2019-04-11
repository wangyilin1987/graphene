/**
 *  @file
 *  @copyright defined in eos/LICENSE
 */
#include <eosio/base_api_plugin/base_api_plugin.hpp>

#include <fc/variant.hpp>
#include <fc/io/json.hpp>

#include <chrono>

namespace eosio { namespace detail {
  struct base_api_plugin_empty {};
}}

FC_REFLECT(eosio::detail::base_api_plugin_empty, );

namespace eosio {

static appbase::abstract_plugin& _base_api_plugin = app().register_plugin<base_api_plugin>();

using namespace eosio;

base_api_plugin::base_api_plugin(){}
base_api_plugin::~base_api_plugin(){}

#define CALL(api_name, api_handle, api_namespace, call_name, http_response_code) \
{std::string("/v1/" #api_name "/" #call_name), \
   [api_handle](string, string body, url_response_callback cb) mutable { \
          api_handle.validate(); \
          try { \
             if (body.empty()) body = "{}"; \
             auto result = api_handle.call_name(fc::json::from_string(body).as<api_namespace::call_name ## _params>()); \
             cb(http_response_code, fc::json::to_string(result)); \
          } catch (...) { \
             http_plugin::handle_exception(#api_name, #call_name, body, cb); \
          } \
       }}

#define CALL_ASYNC(api_name, api_handle, api_namespace, call_name, call_result, http_response_code) \
{std::string("/v1/" #api_name "/" #call_name), \
   [api_handle](string, string body, url_response_callback cb) mutable { \
      if (body.empty()) body = "{}"; \
      api_handle.validate(); \
      api_handle.call_name(fc::json::from_string(body).as<api_namespace::call_name ## _params>(),\
         [cb, body](const fc::static_variant<fc::exception_ptr, call_result>& result){\
            if (result.contains<fc::exception_ptr>()) {\
               try {\
                  result.get<fc::exception_ptr>()->dynamic_rethrow_exception();\
               } catch (...) {\
                  http_plugin::handle_exception(#api_name, #call_name, body, cb);\
               }\
            } else {\
               cb(http_response_code, result.visit(async_result_visitor()));\
            }\
         });\
   }\
}

#define BASE_RO_CALL(call_name, http_response_code) CALL(base, ro_api, base_apis::read_only, call_name, http_response_code)
#define BASE_RW_CALL(call_name, http_response_code) CALL(base, rw_api, base_apis::read_write, call_name, http_response_code)
#define BASE_RO_CALL_ASYNC(call_name, call_result, http_response_code) CALL_ASYNC(base, ro_api, base_apis::read_only, call_name, call_result, http_response_code)
#define BASE_RW_CALL_ASYNC(call_name, call_result, http_response_code) CALL_ASYNC(base, rw_api, base_apis::read_write, call_name, call_result, http_response_code)



void base_api_plugin::plugin_startup() {
   ilog("starting base_api_plugin");
   // lifetime of plugin is lifetime of application   
   auto ro_api = app().get_plugin<base_plugin>().get_read_only_api();
   auto rw_api = app().get_plugin<base_plugin>().get_read_write_api();

   auto& _http_plugin = app().get_plugin<http_plugin>();
   _http_plugin.add_api({
      BASE_RO_CALL(get_info, 200l)
   });
}

void base_api_plugin::plugin_initialize(const variables_map& options) {
     ilog("starting plugin_initialize");
}
}
