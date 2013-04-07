module Support
  module Helpers
    def read_sample_file file_name
      File.read File.expand_path("../../../fixtures/samples/#{file_name}", __FILE__)
    end

    def log_path file_name
      File.expand_path("../../../fixtures/logs/#{file_name}", __FILE__)
    end
  end
end
