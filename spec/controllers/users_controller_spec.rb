require 'spec_helper'

describe UsersController do
	before { @profile = Profile.new(birthdate:"party@usa.org", city: "Davis", state: "CA", bio: "Laugh Louder, Live Longer")}

	subject{ @profile }

	it {should respond_to(:birthdate)}
	it {should respond_to(:city)}
	it {should respond_to(:state)}
	it {should respond_to(:bio)}

	describe "when birthdate is not present" do
		before { @profile.birthdate = " "}
		it {should_not be_valid}
	end

	describe "when city is not present" do
		before { @profile.city = " "}
		it {should_not be_valid}
	end

	describe "when state is not present" do
		before { @profile.state = " "}
		it {should_not be_valid}
	end

	describe "when bio is not present" do
		before { @profile.bio = " "}
		it {should_not be_valid}
	end

	



end
