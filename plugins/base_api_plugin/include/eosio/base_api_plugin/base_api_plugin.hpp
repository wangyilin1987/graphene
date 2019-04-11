/**
 *  @file
 *  @copyright defined in eos/LICENSE
 */
#pragma once

#include <eosio/base_plugin/base_plugin.hpp>
#include <eosio/http_plugin/http_plugin.hpp>

#include <appbase/application.hpp>

namespace eosio {

using namespace appbase;

class base_api_plugin : public plugin<base_api_plugin> {
public:
   APPBASE_PLUGIN_REQUIRES((base_plugin) (http_plugin))

   base_api_plugin() = default;
   base_api_plugin(const base_api_plugin&) = delete;
   base_api_plugin(base_api_plugin&&) = delete;
   base_api_plugin& operator=(const base_api_plugin&) = delete;
   base_api_plugin& operator=(base_api_plugin&&) = delete;
   virtual ~base_api_plugin() override = default;

   virtual void set_program_options(options_description& cli, options_description& cfg) override {}
   void plugin_initialize(const variables_map& vm);
   void plugin_startup();
   void plugin_shutdown() {}

private:
};

}
