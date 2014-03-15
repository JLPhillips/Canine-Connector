require "spec_helper"

describe DogMailer do
  describe "dog_alert" do
    let(:mail) { DogMailer.dog_alert }

    # it "renders the headers" do
    #   mail.subject.should eq("Dog alert")
    #   mail.to.should eq(["to@example.org"])
    #   mail.from.should eq(["from@example.com"])
    # end

    # it "renders the body" do
    #   mail.body.encoded.should match("Hi")
    # end
  end

end
