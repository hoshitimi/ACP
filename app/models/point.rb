class Point < ApplicationRecord
    validate :error_check

    def error_check
        if fluctuation.blank?
            errors[:base] << '増減させるポイント数が未入力です'
        end
        if summary.blank?
            errors[:base] << '概要が未入力です'
        end
    end
 
end
