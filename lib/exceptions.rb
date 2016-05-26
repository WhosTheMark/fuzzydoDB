module Exceptions
  class UnauthorizedAccessError < StandardError
    def status
      403
    end

    def message
      'unauthorized access'
    end

    def to_hash
      {
        meta: {
          code: status,
          message: message
        }
      }
    end

    def to_json(*)
      to_hash.to_json
    end
  end
end