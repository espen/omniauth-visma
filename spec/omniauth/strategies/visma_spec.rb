require 'spec_helper'
require 'omniauth-visma'

describe OmniAuth::Strategies::Visma do
  subject do
    strategy = OmniAuth::Strategies::Visma.new(nil, @options || {})
    strategy.stub(:session) { {} }
    strategy
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'should have the correct Visma site' do
      subject.client.site.should eq("https://eaccountingapi.vismaonline.com/v2/")
    end

    it 'should have the correct authorization url' do
      subject.client.options[:authorize_url].should eq("https://identity.vismaonline.com/connect/authorize")
    end

    it 'should have the correct token url' do
      subject.client.options[:token_url].should eq('https://identity.vismaonline.com/connect/token')
    end

  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should eq('/auth/visma/callback')
    end
  end

  describe '#environment' do

    subject do
      strategy = OmniAuth::Strategies::Visma.new(nil, @options || {})
      strategy.stub(:session) { {} }
      strategy
    end

    it 'should use production environment by default' do
      subject.client.authorize_url.should eq("https://identity.vismaonline.com/connect/authorize")
    end

    it 'should set environment' do
      @options = {:environment => :sandbox}
      subject.options.environment.should eq(:sandbox)
      subject.client.authorize_url.should eq("https://identity-sandbox.test.vismaonline.com/connect/authorize")
    end

  end

end
