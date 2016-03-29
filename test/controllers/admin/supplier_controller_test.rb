require File.dirname(__FILE__) + '/../../test_helper'  

class Admin::SupplierControllerTest < ActionController::TestCase
  fixtures :suppliers

  test "new" do
    get :new  
    assert_template 'admin/supplier/new'  
    assert_tag 'h1', :content => 'Create new supplier'  
    assert_tag 'form', :attributes => { :action => '/admin/supplier/create' }   
  end  

  test "create" do
    get :new    
    assert_template 'admin/supplier/new'
    assert_difference(Supplier, :count) do
      post :create, :supplier => {:name => 'Joel'}
      assert_response :redirect
      assert_redirected_to :action => 'index'      
    end
    assert_equal 'Supplier Joel was succesfully created.', flash[:notice]
  end

  test "failing_create" do
    assert_no_difference(Supplier, :count) do
      post :create, :supplier => {:name => 'Joel'}
      assert_response :success
      assert_template 'admin/supplier/new'
      assert_tag :tag => 'div', :attributes => {:class => 'field_with_errors'}
    end
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => { :name => 'supplier[name]', :value => 'Joel' }
  end

  test "update" do
    post :update, :id => 1, :supplier => { :name => 'Joseph' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Joseph', Supplier.find(1).name
  end

  test "test_destroy" do
    assert_difference(Supplier, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Succesfully deleted supplier Joel.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
        :content => 'Succesfully deleted supplier Joel.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_template 'admin/supplier/show'
    assert_equal 'Joel', assigns(:supplier).name
    assert_tag "h1", :content => Supplier.find(1).name
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Supplier.count + 1, :only => {:tag => 'tr'} }
    Supplier.find_each do |a|
      assert_tag :tag => 'td', :content => a.name
    end
  end
end
