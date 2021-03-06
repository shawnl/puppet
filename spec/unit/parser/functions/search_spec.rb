#!/usr/bin/env rspec
require 'spec_helper'

describe "the 'search' function" do
  before :all do
    Puppet::Parser::Functions.autoloader.loadall
  end

  let :scope do Puppet::Parser::Scope.new end

  it "should exist" do
    Puppet::Parser::Functions.function("search").should == "function_search"
  end

  it "should invoke #add_namespace on the scope for all inputs" do
    scope.expects(:add_namespace).with("where")
    scope.expects(:add_namespace).with("what")
    scope.expects(:add_namespace).with("who")
    scope.function_search(["where", "what", "who"])
  end
end
