# Copyright 2017 Proyectos y Sistemas de Mantenimiento SL (eProsima).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

add_compile_definitions(FASTRTPS_NO_LIB)

add_subdirectory(rtps/common)
add_subdirectory(rtps/DataSharing)
add_subdirectory(rtps/builtin)
add_subdirectory(rtps/reader)
add_subdirectory(rtps/writer)
add_subdirectory(rtps/history)
add_subdirectory(rtps/resources/timedevent)
add_subdirectory(rtps/network)
if(NOT QNX)
    add_subdirectory(rtps/flowcontrol)
endif()
add_subdirectory(rtps/persistence)
add_subdirectory(rtps/discovery)
add_subdirectory(dds/collections)
add_subdirectory(dds/core)
add_subdirectory(dds/participant)
add_subdirectory(dds/publisher)
add_subdirectory(dds/subscriber)
add_subdirectory(dds/topic)
add_subdirectory(dds/topic/DDSSQLFilter)
add_subdirectory(dds/status)
add_subdirectory(dynamic_types)
add_subdirectory(transport)
add_subdirectory(logging)
add_subdirectory(utils)
add_subdirectory(xmlparser)
add_subdirectory(xtypes)
add_subdirectory(statistics/dds)
add_subdirectory(cmake)

if(SECURITY)
    add_subdirectory(security/authentication)
    add_subdirectory(security/cryptography)
    add_subdirectory(security/accesscontrol)
    add_subdirectory(security/logging)
    if(NOT QNX)
        add_subdirectory(rtps/security)
    endif()
endif()

if(FASTDDS_STATISTICS)
    add_subdirectory(statistics/rtps)
endif(FASTDDS_STATISTICS)
