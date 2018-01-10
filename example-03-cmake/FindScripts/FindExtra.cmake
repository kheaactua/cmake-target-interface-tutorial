include(FindPackageHandleStandardArgs)

# Find paths to assimp folders
# Inlcudes path
find_path(EXTRA_LIB_BASE_DIR
	NAMES include/extra/extra_functions.h
	PATHS
		${VENDOR_DIR}/extra
	NO_DEFAULT_PATH
)

find_library(EXTRA_LIB_LIB
	NAMES extra
	PATHS
		${EXTRA_LIB_BASE_DIR}
	NO_DEFAULT_PATH
)

find_path(EXTRA_LIB_INCLUDE_DIR
	NAMES extra/extra_functions.h
	PATHS
		${EXTRA_LIB_BASE_DIR}/include
	NO_DEFAULT_PATH
)

if (NOT TARGET Extra)
	message("Extra Lib")
	message("  Include: ${EXTRA_LIB_INCLUDE_DIR}")
	message("  Lib:     ${EXTRA_LIB_LIB}")

	if (WIN32)
			MESSAGE(STATUS "   Bin: ${EXTRA_LIB_BASE_DIR}/bin")
	endif()

	add_library(Extra INTERFACE)

	# Include Path
	set_property(TARGET Extra PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${EXTRA_LIB_INCLUDE_DIR})

	# Because ExtraLib is considered a third party vendor, we can add it to the
	# system path which will result in the compiler not providing warnings from
	# ExtraLib code when compiling against it.
	set_property(TARGET Extra PROPERTY INTERFACE_SYSTEM_INCLUDE_DIRECTORIES ${EXTRA_LIB_INCLUDE_DIR})

	# Lib path
	target_link_libraries(Extra INTERFACE ${EXTRA_LIB_LIB})
endif()

# vim: ts=2 sw=2 sts=2 noet ffs=unix ft=cmake :
