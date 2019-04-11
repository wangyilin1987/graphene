file(GLOB HEADERS "include/eosio/base_api_plugin/*.hpp")
add_library( base_api_plugin
             base_api_plugin.cpp
             ${HEADERS} )

target_link_libraries( base_api_plugin http_plugin appbase )
target_include_directories( base_api_plugin PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" )
