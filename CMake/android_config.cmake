message(STATUS "Setting Android configurations")
message(STATUS "Prepare RealSense SDK for Android OS (${ANDROID_NDK_ABI_NAME})")

macro(os_set_flags)
    unset(WIN32)
    unset(UNIX)
    unset(APPLE)
    set(BUILD_WITH_TM2 OFF)
    set(BUILD_UNIT_TESTS OFF)
    set(BUILD_LIVE_TEST OFF)
    set(BUILD_EXAMPLES OFF)
    set(BUILD_TOOLS OFF)
    set(BUILD_WITH_OPENMP OFF)    
    set(BUILD_GRAPHICAL_EXAMPLES OFF)
    set(ANDROID_STL "c++_static")
    set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -fPIC -pedantic -g -D_DEFAULT_SOURCE")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -pedantic -g -Wno-missing-field-initializers")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-switch -Wno-multichar")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fPIE -pie")
    set(HWM_OVER_XU ON)
	
    if(FORCE_RSUSB_BACKEND)
        set(BACKEND RS2_USE_ANDROID_BACKEND)
        set(IMPORT_DEPTH_CAM_FW OFF)
    else()
        set(BACKEND RS2_USE_V4L2_BACKEND)
    endif()
endmacro()

macro(os_target_config)
    if(BUILD_SHARED_LIBS)
        find_library(log-lib log)
        target_link_libraries(${LRS_TARGET} PRIVATE log)
    endif()
endmacro()
