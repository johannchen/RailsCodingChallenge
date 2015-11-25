
class Cuboid
  attr_accessor :x,:y,:z,:length,:width,:height

  def initialize(x=0, y=0, z=0, l=1, w=1, h=1)
    @x,@y,@z = x,y,z
    @length,@width,@height = l,w,h
  end
  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
    @x,@y,@z=x,y,z
    true
  end

  def vertices
    corners = []
    x,y,z = @x,@y,@z
    l,w,h = @length,@width,@height
    corners << [x, y, z]
    corners << [x, y, z+h]
    corners << [x, y+w, z]
    corners << [x, y+w, z+h]
    corners << [x+l, y, z]
    corners << [x+l, y, z+h]
    corners << [x+l, y+w, z]
    corners << [x+l, y+w, z+h]
    corners
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    overlap?(@x, @length, other.x, other.length) &&
    overlap?(@y, @width, other.y, other.width) &&
    overlap?(@z, @height, other.z, other.height)
  end

  # rotates 90 degrees along axis
  def rotates90(axis)
    l,w,h = @length,@width,@height
    if axis == 'x'
      @width,@height = h,w
    elsif axis == 'y'
      @length,@height = h,l
    else
      @length,@width = w,l
    end
  end

  #END public methods that should be your starting point
  private
  # check intersect in one dimension or a straight line
  # x1 and x2 are the starting points
  def overlap?(x1, length1, x2, length2)
    if x1 < x2
      x1 + length1 > x2 ? true : false
    elsif x1 > x2
      x2 + length2 > x1 ? true : false
    else
      true
    end
  end
end
