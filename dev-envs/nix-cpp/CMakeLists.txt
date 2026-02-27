cmake_minimum_required(VERSION 3.28)

project(
  projectname 
  VERSION 0.0.1 
  LANGUAGES CXX
)

include_directories(
  inc
)

file(
  GLOB_RECURSE 
  SOURCE_FILES 
  "src/**/*.cpp"
)

add_executable(
  ${PROJECT_NAME} 
  ${SOURCE_FILES}
  src/main.cpp
)
