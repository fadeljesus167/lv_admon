module BillsHelper
    def calculate_fee_form_fields(payment)
        (payment.amount/payment.rate)/payment.student.quota
    end
end
