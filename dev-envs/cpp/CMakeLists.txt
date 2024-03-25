cmake_minimum_required(VERSION 3.28)

project(projectname 
  VERSION 0.0.1 
  LANGUAGES CXX)

include_directories(
  include)

add_executable(${PROJECT_NAME} 
  src/main.cpp)
