#ifndef NEWTON_HPP
#define NEWTON_HPP

#include <Godot.hpp>
#include <Spatial.hpp>

namespace godot
{
    class Newton : public Spatial
    {
        GODOT_CLASS(Newton, Spatial)

    private:
        float time_passed;
    
    public:
        static void _register_methods();

        Newton();
        ~Newton();

        void test();
    };
}

#endif