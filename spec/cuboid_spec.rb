require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  describe "#initialize" do
    it "creats a cuboid" do
      cube = Cuboid.new(3,2,1,4,5,6)
      expect(cube.x).to eq(3)
      expect(cube.y).to eq(2)
      expect(cube.z).to eq(1)
      expect(cube.length).to eq(4)
      expect(cube.width).to eq(5)
      expect(cube.height).to eq(6)
    end
  end

  describe "move_to" do
    it "changes the origin in the simple happy case" do
      #expect(subject.move_to!(1,2,3)).to be true
      subject.move_to!(1,2,3)
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(2)
      expect(subject.z).to eq(3)
    end
  end

  describe "#vertices" do
    it "stores the vertices in an array" do
      expect(subject.vertices).to eq([[0,0,0], [0,0,1], [0,1,0], [0,1,1], [1,0,0], [1,0,1], [1,1,0], [1,1,1]])
    end
  end

  describe "intersects?" do
    it "does not intersect with another cuboid" do
      c = Cuboid.new(2,2,2,2,3,4)
      expect(subject.intersects?(c)).to be false
    end
    it "does not intersect when sharing a side with another cuboid" do
      c = Cuboid.new(1,0,0,1,1,1)
      expect(subject.intersects?(c)).to be false
    end
    it "intersects inside another cuboid" do
      c = Cuboid.new(0,0,0,2,3,4)
      expect(subject.intersects?(c)).to be true
    end
    it "intersects partially with another cuboid" do
      c1 = Cuboid.new(0,0,0,2,3,4)
      c2 = Cuboid.new(1,1,1,2,3,4)
      expect(c1.intersects?(c2)).to be true
    end
  end

  describe "rotates90" do
    let(:c) { Cuboid.new(0,0,0,1,2,3) }
    it "rotates 90 degree along the x-axis" do
      c.rotates90('x')
      expect([c.length, c.width, c.height]).to eq([1,3,2])
    end
    it "rotates 90 degree along the y-axis" do
      c.rotates90('y')
      expect([c.length, c.width, c.height]).to eq([3,2,1])
    end
    it "rotates 90 degree along the z-axis" do
      c.rotates90('z')
      expect([c.length, c.width, c.height]).to eq([2,1,3])
    end
  end
end
