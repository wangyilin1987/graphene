file(GLOB HEADERS "include/eosio/base_plugin/*.hpp" )
add_library( base_plugin
             base_plugin.cpp
             ${HEADERS} )

target_link_libraries( base_plugin  appbase fc )
target_include_directories( base_plugin PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include ${CMAKE_CURRENT_SOURCE_DIR}/../chain_interface/include  "${CMAKE_CURRENT_SOURCE_DIR}/../../libraries/appbase/include")
