cmake_minimum_required(VERSION 3.8)
project(MCRewrite LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)

# set all variables
set(INCDIR ${CMAKE_SOURCE_DIR}/include)

# GL includes
find_package(OpenGL REQUIRED)

# File for GLAD library
add_library(gfx STATIC src/glad.c)

# include directory
target_include_directories(gfx PRIVATE ${INCDIR})