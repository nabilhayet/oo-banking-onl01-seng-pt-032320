class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender,reciever,amount)
    @sender = sender 
    @receiver = reciever 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if (self.sender.valid? == true && self.receiver.valid? == true) 
       return true 
    else 
      return false 
    end 
  end 
  
    def execute_transaction
       if self.valid? && self.sender.balance > self.amount && self.status == "pending"
          sender.balance -= self.amount
          receiver.balance += self.amount
          self.status = "complete"
       else 
        self.status = "rejected"     
       "Transaction rejected. Please check your account balance."
      end 
    end 
    

  def reverse_transfer 
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
  end 

end 
