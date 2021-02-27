#include "newton.hpp"

using namespace godot;

void Newton::_register_methods()
{
    register_method("test", &Newton::test);
}

Newton::Newton()
{

}

Newton::~Newton()
{

}

void Newton::test()
{
    Godot::print("Hello from test()!");
}