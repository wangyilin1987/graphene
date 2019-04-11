/**
 *  @file
 *  @copyright defined in eos/LICENSE
 */
#pragma once
#include <appbase/application.hpp>

namespace eosio {
   using namespace appbase;

   struct connection_status {
      string            peer;
      bool              connecting = false;
      bool              syncing    = false;
   };

   class net_plugin : public appbase::plugin<net_plugin>
   {
      public:
        net_plugin();
        virtual ~net_plugin();

        APPBASE_PLUGIN_REQUIRES();

        virtual void set_program_options(options_description& cli, options_description& cfg) override;
        void handle_sighup() override;

        void plugin_initialize(const variables_map& options);
        void plugin_startup();
        void plugin_shutdown();


        string                       connect( const string& endpoint );
        string                       disconnect( const string& endpoint );

        size_t num_peers() const;

   };

}

