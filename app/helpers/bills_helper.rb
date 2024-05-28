module BillsHelper
    def calculate_fee_form_fields(payment)
        result = (payment.amount/payment.rate)/payment.student.quota
        (result.to_f - result.to_i) > 0.0 ? result.to_i + 1 : result.to_i
    end
end
