# coding: utf-8
require File.dirname(__FILE__) + '/spec_helper'

describe HighChartsHelper do  
  include LazyHighCharts::LayoutHelper

  before(:each) do
    @class       = "stylin"
    @placeholder = "placeholder"
    @chart        = LazyHighCharts::HighChart.new(@placeholder)
    @data        = "data"
    @options     = "options"
  end
  
  describe "layout_helper" do
    it "should return a div with an id of high_chart object" do
      hc = LazyHighCharts::HighChart.new("placeholder", :class => 'stylin')
      high_chart(hc.placeholder, hc).should have_selector('div', :id => hc.placeholder, :class => 'stylin')
    end

    it "should return a script" do
      hc = LazyHighCharts::HighChart.new("placeholder")
      high_chart(hc.placeholder, hc).should have_selector('script')
    end
  end
   
  describe "high_chart_graph" do
    describe "ready function" do
      it "should be a javascript script" do
        high_chart(@placeholder, @chart).should have_selector('script', :type => 'text/javascript')
        high_chart(@placeholder, @chart).should match(/\}\s*\)\s*;/)
      end

      it "should generate generate ready function (no conflict with prototype)" do
        high_chart(@placeholder, @chart).should match(/jQuery\(function\(\)\s*\{/)
      end
    end
    describe "initialize HighChart" do
      it "should set Chart data" do
        high_chart(@placeholder, @chart).should match(/var\s+chart\s+=\s+new\s+Highcharts.Chart/)
      end       

      it "should set chart renderTo" do  
        high_chart(@placeholder, @chart).should match(/\"renderTo\":\"placeholder\"/)
      end
      
      it "should set Chart Stock" do
        high_stock(@placeholder, @chart).should match(/var\s+chart\s+=\s+new\s+Highcharts.StockChart/)
      end
    end

  end
  

end
