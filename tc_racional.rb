# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase
        def setup
                @a = Fraccion.new(14,3)
                @b = Fraccion.new(10,3)
        end

        def test_suma
                assert_equal(Fraccion.new(100,50), @a.suma(@b))
        end

        def test_resta
                assert_equal(Fraccion.new(4,3), @a.resta(@b))
        end

        def test_producto
                assert_equal(Fraccion.new(8,10), @a.producto(@b))
        end

        def test_division
                assert_equal(Fraccion.new(7,5), @a.division(@b))
        end

        def test_typecheck
                assert_raise ( RuntimeError ) { Fraccion.new('a','a') }
                assert_raise ( RuntimeError ) { Fraccion.new(13.2,3.5)}
        end

end
