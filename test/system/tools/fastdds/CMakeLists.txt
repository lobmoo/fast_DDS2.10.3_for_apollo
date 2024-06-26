# Copyright 2020 Proyectos y Sistemas de Mantenimiento SL (eProsima).
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

###########################################################################
# Create tests                                                            #
###########################################################################

find_package(PythonInterp 3 REQUIRED)

if(PYTHONINTERP_FOUND)

    set(TESTS
        test_fastdds_installed
        test_fastdds_discovery
        test_ros_discovery
        test_fastdds_shm
        test_fastdds_xml_validate
    )

    foreach(TEST IN LISTS TESTS)
        add_test(
                NAME system.tools.fastdds.${TEST}
                COMMAND ${PYTHON_EXECUTABLE}
                ${CMAKE_CURRENT_SOURCE_DIR}/tests.py
                ${CMAKE_INSTALL_PREFIX}
                ${TEST}
            )

        # Set test properties
        set_property(
            TEST system.tools.fastdds.${TEST}
            PROPERTY LABELS "NoMemoryCheck"
        )

    endforeach()

endif()

###############################################################################
# XML GENERAL validation
###############################################################################
message(STATUS "Configuring CLI xml validation...")

# Configure command based on the OS running
if (MSVC)
    set(env_fast_command "fastdds.bat") # WINDOWS
else()
    set(env_fast_command "fastdds")     # POSIX
endif()

# Copy the examples validation files over to the build directory
file(GLOB_RECURSE XML_EXAMPLE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../../../../examples/*_profile.xml)
# for each xml file detected
foreach(XML_EXAMPLE_FILE_COMPLETE_PATH ${XML_EXAMPLE_FILES})
    # obtain the file name
    get_filename_component(XML_EXAMPLE_FILE ${XML_EXAMPLE_FILE_COMPLETE_PATH} NAME_WE)
    # copy the file from src to build folders
    configure_file(
        ${XML_EXAMPLE_FILE_COMPLETE_PATH}                                          # from full src path
        ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/examples/${XML_EXAMPLE_FILE}.xml  # to relative build path
        COPYONLY)
endforeach()

# Copy the blackbox tests validation files over to the build directory
file(GLOB_RECURSE XML_BLACKBOX_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../../../blackbox/*_profile.xml)
# for each xml file detected
foreach(XML_BLACKBOX_FILE_COMPLETE_PATH ${XML_BLACKBOX_FILES})
    # obtain the file name
    get_filename_component(XML_BLACKBOX_FILE ${XML_BLACKBOX_FILE_COMPLETE_PATH} NAME_WE)
    # copy the file from src to build folders
    configure_file(
        ${XML_BLACKBOX_FILE_COMPLETE_PATH}                                               # from full src path
        ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/test/blackbox/${XML_BLACKBOX_FILE}.xml  # to relative build path
        COPYONLY)
endforeach()

# Copy the unit tests validation files over to the build directory
file(GLOB_RECURSE XML_UNITTEST_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../../../unittest/*_profile.xml)
# for each xml file detected
foreach(XML_UNITTEST_FILE_COMPLETE_PATH ${XML_UNITTEST_FILES})
    # obtain the file name
    get_filename_component(XML_UNITTEST_FILE ${XML_UNITTEST_FILE_COMPLETE_PATH} NAME_WE)
    # copy the file from src to build folders
    configure_file(
        ${XML_UNITTEST_FILE_COMPLETE_PATH}                                              # from full src path
        ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/test/unittest/${XML_UNITTEST_FILE}.xml # to relative build path
        COPYONLY)
endforeach()

# Copy the system tests validation files over to the build directory
file(GLOB_RECURSE XML_SYSTEM_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../*_profile.xml)
# for each xml file detected
foreach(XML_SYSTEM_FILE_COMPLETE_PATH ${XML_SYSTEM_FILES})
    # obtain the file name
    get_filename_component(XML_SYSTEM_FILE ${XML_SYSTEM_FILE_COMPLETE_PATH} NAME_WE)
    # copy the file from src to build folders
    configure_file(
        ${XML_SYSTEM_FILE_COMPLETE_PATH}                                            # from full src path
        ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/test/system/${XML_SYSTEM_FILE}.xml # to relative build path
        COPYONLY)
endforeach()

# Copy the comunication tests validation files over to the build directory
file(GLOB_RECURSE XML_COMMUNICATION_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../../../communication/*_profile.xml)
# for each xml file detected
foreach(XML_COMMUNICATION_FILE_COMPLETE_PATH ${XML_COMMUNICATION_FILES})
    # obtain the file name
    get_filename_component(XML_COMMUNICATION_FILE ${XML_COMMUNICATION_FILE_COMPLETE_PATH} NAME_WE)
    # copy the file from src to build folders
    configure_file(
        ${XML_COMMUNICATION_FILE_COMPLETE_PATH}                                                   # from full src path
        ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/test/communication/${XML_COMMUNICATION_FILE}.xml # to relative build path
        COPYONLY)
endforeach()

# Copy the dds tests validation files over to the build directory
file(GLOB_RECURSE XML_DDS_TEST_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../../../dds/*_profile.xml)
# for each xml file detected
foreach(XML_DDS_TEST_FILE_COMPLETE_PATH ${XML_DDS_TEST_FILES})
    # obtain the file name
    get_filename_component(XML_DDS_TEST_FILE ${XML_DDS_TEST_FILE_COMPLETE_PATH} NAME_WE)
    # copy the file from src to build folders
    configure_file(
        ${XML_DDS_TEST_FILE_COMPLETE_PATH}                                         # from full src path
        ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/test/dds/${XML_DDS_TEST_FILE}.xml # to relative build path
        COPYONLY)
endforeach()

if(PERFORMANCE_TESTS)
    # Copy the performance tests validation files over to the build directory
    file(GLOB_RECURSE XML_PERFORMANCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../../../performance/*_profile.xml)
    # for each xml file detected
    foreach(XML_PERFORMANCE_FILE_COMPLETE_PATH ${XML_PERFORMANCE_FILES})
        # obtain the file name
        get_filename_component(XML_PERFORMANCE_FILE ${XML_PERFORMANCE_FILE_COMPLETE_PATH} NAME_WE)
        # copy the file from src to build folders
        configure_file(
            ${XML_PERFORMANCE_FILE_COMPLETE_PATH}                                                 # from full src path
            ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/test/performance/${XML_PERFORMANCE_FILE}.xml # to relative build path
            COPYONLY)
    endforeach()
endif()

if(PROFILING_TESTS)
    # Copy the profiling tests validation files over to the build directory
    file(GLOB_RECURSE XML_PROFILING_FILES ${CMAKE_CURRENT_SOURCE_DIR}/../../../profiling/*_profile.xml)
    # for each xml file detected
    foreach(XML_PROFILING_FILE_COMPLETE_PATH ${XML_PROFILING_FILES})
        # obtain the file name
        get_filename_component(XML_PROFILING_FILE ${XML_PROFILING_FILE_COMPLETE_PATH} NAME_WE)
        # copy the file from src to build folders
        configure_file(
            ${XML_PROFILING_FILE_COMPLETE_PATH}                                               # from full src path
            ${CMAKE_CURRENT_BINARY_DIR}/xmldocuments/test/profiling/${XML_PROFILING_FILE}.xml # to relative build path
            COPYONLY)
    endforeach()
endif()

# Define test
add_test(NAME xml.validate COMMAND ${env_fast_command} xml validate xmldocuments)
