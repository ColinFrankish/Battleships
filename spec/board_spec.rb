require 'board'


describe Board do 
let(:player) {double :player, name: "Fred"}
let(:board) {Board.new(player)}

	it "should know who owns it" do
		expect(board.owner).to eq("Fred")
	end

	it "should return a representation of the board" do
		expect(board.rows.length).to eq(10)
		board.rows.each { |a| expect(a.length).to eq(10) }
	end

	it "should know what's at any co-ordinates" do
			expect(board.check_coords("A7")).to eq(" ")
			expect(board.check_coords("A8")).to eq(" ")
			expect(board.check_coords("A9")).to eq("s")
			expect(board.check_coords("A10")).to eq("s")
	end

	it "should be case insensitive in recognising co-ordinates" do
			expect(board.check_coords("a7")).to eq(" ")
			expect(board.check_coords("a8")).to eq(" ")
			expect(board.check_coords("a9")).to eq("s")
			expect(board.check_coords("a10")).to eq("s")
	end

  it "should be able to set the value at particular co-ordinates" do
  	expect(board.check_coords("A1")).to eq(" ")
  	board.set_value_at_coords("o", "A1")
  	expect(board.check_coords("A1")).to eq("o")
  end

  it "should be able to shoot a ship" do
  	expect(board.check_coords("A9")).to eq("s")
  	board.register_shot "A9"
  	expect(board.check_coords("A9")).to eq("x")
  end

end