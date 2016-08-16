class Triangle
  attr_accessor :side1,:side2,:side3

  def initialize(side1,side2,side3)
    @side1,@side2,@side3 = side1,side2,side3
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

	def isosceles?
		[side1,side2,side3].uniq.length == 2
	end

  def scalene?
    (equilateral? || isosceles?) ? false : true 
  end

  def recite_facts
    triangle_facts = {equilateral? => "This triangle is equilateral", isosceles? =>"This triangle is isosceles! Also, that word is hard to type." , scalene? =>'This triangle is scalene and mathematically boring.'}
    triangle_facts.each {|key,value| puts value if key} 		
    puts 'The angles of this triangle are ' + calculate_angles(side1,side2,side3).join(',')
    p 'This triangle is also a right triangle!' if calculate_angles(side1,side2,side3).include? 90
  end

  def calculate_angles(a,b,c)
    angle_list = {angleA: [b,c,a,b,c], angleB: [a,c,b,a,c], angleC: [a,b,c,a,b]}
    angles = []
    angle_list.each {|key,value| angles << (value = radians_to_degrees(Math.acos((value[0]**2 + value[1]**2 - value[2]**2) / (2.0 * value[3] * value[4]))))}
    [angles[0],angles[1],angles[2]]
  end

  def radians_to_degrees(rads)
    (rads * 180 / Math::PI).round
  end	

end


triangles = [[5,5,5], [5,12,13]]
triangles.each { |sides|
	tri = Triangle.new(*sides)
	tri.recite_facts
}
