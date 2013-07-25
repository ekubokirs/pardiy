require 'spec_helper'

describe EventsController do
	before { @event = Event.new(title:"party@usa.org", venue: "Davis", event_type: "CA")}

		subject{ @event }

		it {should respond_to(:title)}
		it {should respond_to(:venue)}
		it {should respond_to(:event_type)}

		describe "when title is not present" do
			before { @event.title = " "}
			it {should_not be_valid}
		end

		describe "when venue is not present" do
			before { @event.venue = " "}
			it {should_not be_valid}
		end

		describe "when type is not present" do
			before { @event.event_type = " "}
			it {should_not be_valid}
		end
end
