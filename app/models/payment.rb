class Payment < ActiveRecord::Base
    belongs_to :credit
    has_many :receipts
    has_many :tickets
    before_save :iniciar_vencimientos
    def pagado
        if self.total_pagado.to_f >= self.importe.to_f
             self.update(:estatus => 2)
             return true
         else
            return false
        end
    end
    def deuda_sin_interes
        self.importe - self.total_pagado
    end
    def deuda_con_interes
        self.importe - self.total_pagado + self.interes
    end 
    def total_pagado
        Ticket.where(payment_id:self.id).where(status:0).sum(:cantidad)
    end
    def activo
        self.credit.payments.order(:fecha_de_pago).each do |tk|
            puts tk.id
            unless tk.pagado
                if tk.id == self.id
                    return true
                else
                    return false
                end
            end
                
        end
    end
    def cargar_interes
        unless self.estatus==2
            inter =  self.deuda_sin_interes * (self.credit.product.interes_moratorio_aplicable.to_f/100)
            self.update(interes:inter+self.interes,estatus:1,vencimientos:self.vencimientos+1)
        end
        
    end
    def get_last_generated
        return self.tickets.where(status:1).last
    end
    def iniciar_vencimientos
      self.vencimientos  ||= 0
    end
    # 0 ------ al corriente
    # 1 ------ Vencido
    # 2 ------ pagado

end
