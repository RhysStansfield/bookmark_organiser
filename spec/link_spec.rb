require_relative 'spec_helper'
require 'link'

describe Link do

  it 'has no items in database to start with' do
    expect(Link.count).to eq 0
  end

  it 'can have an link added to it' do
    Link.create(title: 'Sweeee',
      uri: 'http://utterbollocks.com',
      description: 'Utterly butterly bollocks')
    expect(Link.count).to eq 1
  end

  it 'can delete items from database' do
    Link.create(title: 'Sweeee',
      uri: 'http://utterbollocks.com',
      description: 'Utterly butterly bollocks')
    Link.all.destroy
    expect(Link.count).to eq 0
  end



  context 'Checking accessing links items' do

    let(:link) do 
      Link.create({ title: 'Superpage', uri: 'http://example.com', 
        description: 'Very useful link' })
    end
  
    it 'has a title' do
      expect(link.title).to eq 'Superpage'
    end
    
    it 'has a description' do
      expect(link.description).to eq 'Very useful link'
    end
  
    it 'has a uri' do
      expect(link.uri).to eq 'http://example.com'
    end

  end

end