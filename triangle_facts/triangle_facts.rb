class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @angle_list = { angleA: [2**side2, 2**side3, 2**side1, side2, side3],
                    angleB: [2**side1, 2**side3, 2**side2, side1, side3],
                    angleC: [2**side1, 2**side2, 2**side3, side1, side2] }
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    [side1, side2, side3].uniq.length == 2
  end

  def scalene?
    equilateral? || isosceles? ? false : true
  end

  def facts
    triangle_facts = { equilateral? => "This triangle is equilateral",
                       isosceles? => "This triangle is isosceles!",
                       scalene? => 'This triangle is scalene and
                       mathematically boring.' }
    triangle_facts.each { |key, value| puts value if key }
  end

  def state_facts
    p "The angles of this triangle are #{angles(@angle_list).join(',')}"
    if angles(@angle_list).include? 90
      p 'This triangle is also a right triangle!'
    end
  end

  def angles(angle_list)
    angles = []
    angle_list.each do |_k, v|
      angles << degrees(Math.acos((v[0] + v[1] - v[2]) / (2.0 * v[3] * v[4])))
    end
    [angles[0], angles[1], angles[2]]
  end

  def degrees(rads)
    (rads * 180 / Math::PI).round
  end
end

triangle = Triangle.new(5, 5, 5)
triangle.facts
triangle.state_facts
