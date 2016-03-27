class Transaction
  attr_reader :id, :product, :customer

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    perform_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.each do |transaction|
      if transaction.id == id
        return transaction
      end
    end
  end

  #def revert
  #  @product.stock += 1
  #  @@transactions.delete_if { |transaction| transaction.id == @id }
  #end

  private

  def perform_transaction
    if @product.stock <= 0
      raise OutOfStockError, "'#{@product.title}' is out of stock."
    end
    @product.stock -= 1
    @@transactions << self
  end

end