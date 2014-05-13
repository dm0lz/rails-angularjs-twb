require 'spec_helper'

describe Api::V1::EntriesController do

  describe "GET 'index'" do

    before(:each) do
      @entry = FactoryGirl.create(:entry)
    end

    it "returns success status" do
      get :index
      expect(response.status).to eq(200)
    end

    it "returns a list of entries" do
      get :index
      expect(response.body).to_not be_empty
    end

    it "returns appropriate entries" do
      get :index
      res = JSON.parse(response.body, symbolize_names: true)
      names = res.collect{ |l| l[:name] }
      expect(names).to include("ooo")
    end

    it "should render zero entries" do
      get 'index', {name: "aaa"}
      res = JSON.parse(response.body, symbolize_names: true)
      names = res.collect{|l| l[:name]}
      expect(names.count).to eq(0)
    end

    it "filters by name" do
      get 'index', {name: "ooo"}
      res = JSON.parse(response.body, symbolize_names: true)
      names = res.collect{|l| l[:name]}
      expect(names.count).to eq(1)
    end

  end

  describe "POST 'create'" do

    it "returns 201 status on create" do
      post "create", { entry: {name: "kkk"} }
      expect(response.status).to eq(201)
    end

    it "returns the created object on create" do
      post "create", { entry: {name: "kkk"} }
      res = JSON.parse(response.body, symbolize_names: true)
      expect(res[:name]).to eq("kkk")
    end

    it "it responds with status 422 when submiting with empty name" do
      post "create", { entry: {name: ""}}
      expect(response.status).to eq(422)
    end

    it "fails with empty name" do
      post "create", { entry: {name: ""}}
      expect(response.body.length).to be == 1
    end

  end

  describe "PUT 'update'" do

    it "returns status 204 on successful update" do
      #put "update", { entry: {name: "zzz"} }
      #binding.pry
      #expect(response.status).to eq(204)
    end
  end 

end
