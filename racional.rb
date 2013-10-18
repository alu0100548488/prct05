# Implementar en este fichero la clase para crear objetos racionales


require_relative "gcd.rb"

class Fraccion
        attr_reader :n, :d
        
        def initialize(n,d)
      raise RuntimeError unless n.is_a? Integer and d.is_a? Integer
                @n, @d = n, d
        end

   def to_s
      "#{@n}/#{@d}"
   end

   def reducir(d)
      mcd = gcd(d.n, d.d)
      Fraccion.new(d.n/mcd, d.d/mcd)
   end

   def suma(r2)
      mcm = (@d * r2.d)/gcd(@d, r2.d)
      f1 = Fraccion.new((mcm/@d) * @n, mcm)
      f2 = Fraccion.new((mcm/r2.d) * r2.n, mcm)
      reducir(Fraccion.new(f1.n + f2.n, mcm))
   end

   def resta(r2)
      mcm = (@d * r2.d)/gcd(@d, r2.d)
      f1 = Fraccion.new((mcm/@d) * @n, mcm)
      f2 = Fraccion.new((mcm/r2.d) * r2.n, mcm)
      reducir(Fraccion.new(f1.n - f2.n, mcm))
   end

   def producto(r2)
      reducir(Fraccion.new(@n * r2.n, @d * r2.d))
   end

   def division(r2)
      reducir(Fraccion.new(@n * r2.d, @d * r2.n))
   end

   def == (r2)
           return @n == r2.n && @d == r2.d if r2.instance_of? Fraccion
           false
   end
end

puts puts puts
a = Fraccion.new(14,3)
puts "Fraccion 1: " + a.to_s
b = Fraccion.new(10,3)
puts "Fraccion 2: " + b.to_s
puts
c = a.suma(b)
puts "Suma: " + c.to_s
d = a.resta(b)
puts "Resta: " + d.to_s
e = a.producto(b)
puts "Producto: " + e.to_s
f = a.division(b)
puts "Division: " + f.to_s
puts puts puts
