#include "gdexample.hpp"

using namespace godot;

void GDExample::_register_methods()
{
    register_method("_process", &GDExample::_process);
}

GDExample::GDExample()
{

}

GDExample::~GDExample()
{

}

void GDExample::_init()
{
    time_passed = 0.0f;
}

void GDExample::_process(float delta)
{
    time_passed += delta;
    Vector2 new_position = Vector2(10.0f + 10.0f * sin(time_passed * 2.0f), 10.0f + 10.0f * cos(time_passed * 1.5f));
    set_position(new_position);
}