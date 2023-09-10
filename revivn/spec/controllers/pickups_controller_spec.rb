# spec/controllers/pickups_controller_spec.rb
require "rails_helper"

RSpec.describe PickupsController, type: :controller do
  describe "POST #create" do
    let(:org) { Org.create(name: "test") }
    let(:user) { User.create(first_name: "test", last_name: "person", org: org) }
    let(:hardware) { HardwareType.create(name: "laptops/desktops") }

    context "with valid parameters" do
      it "creates a new pickup" do
        expect {
          post :create, params: { pickup: { user_id: user.id, org_id: org.id } }
        }.to change(Pickup, :count).by(1)
      end

      it "new pickup has user id set to user" do
        post :create, params: { pickup: { user_id: user.id, org_id: org.id } }
        expect(Pickup.last.user.id).to eq(user.id)
      end

      it "passing in pickup items" do
        post :create, params: { pickup: { user_id: user.id, org_id: org.id, pickup_items_attributes: [
                        { hardware_type_id: hardware.id, quantity: 4, description: "testtt" },
                        { hardware_type_id: hardware.id, quantity: 5, description: "testtt blahhhh" },
                      ] } }
        expect(Pickup.last.pickup_items.length).to eq(2)
        expect(Pickup.last.pickup_items[0].hardware_type_id).to eq(hardware.id)
        expect(Pickup.last.pickup_items[0].quantity).to eq(4)
      end
    end
  end
end
