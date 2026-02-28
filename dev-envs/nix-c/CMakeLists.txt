cmake_minimum_required(VERSION 3.28)
set(CMAKE_C_STANDARD 99)

project(
  projectname 
  VERSION 0.0.1 
  LANGUAGES C
)

include_directories(
  inc
)

file(
  GLOB_RECURSE 
  SOURCE_FILES 
  "src/**/*.c"
)

add_executable(
  ${PROJECT_NAME} 
  ${SOURCE_FILES}
  src/main.c
)
