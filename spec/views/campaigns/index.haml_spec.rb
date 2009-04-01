require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/campaigns/index.html.haml" do
  include CampaignsHelper
  
  before(:each) do
  end

  it "should render list of accounts if list of campaigns is not empty" do
    assigns[:campaigns] = [ Factory(:campaign) ]
    template.should_receive(:render).with(hash_including(:partial => "campaign"))
    render "/campaigns/index.html.haml"
  end

  it "should render a message if there're no campaigns" do
    assigns[:campaigns] = []
    template.should_not_receive(:render).with(hash_including(:partial => "campaigns"))
    render "/campaigns/index.html.haml"
  end

end
