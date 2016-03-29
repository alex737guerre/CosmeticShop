require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "test_name" do
    supplier = Supplier.create(:name => 'Loreal',)
    assert_equal 'Loreal', supplier.name
  end

  #HAY QUE METER UNO TAMBIEN QUE PROVOQUE FALLOS PARA QUE MUESTRE LOS MENSAJES
  #QUE NOS ENSEÑO EN LA CLASE.
end
