module Helpers

   def get_fixture_file(filename)
      current_path = File.join(File.dirname(__FILE__))
      file_path = File.join(current_path, 'fixtures', filename)
      content = IO.read(file_path)
  
      JSON.parse(content, symbolize_names: use_symbols)
   end

   def sample_request(use_symbols = false)
      get_fixture_file('sample_request.json')
    end
   
    def sample_response(use_symbols = false)
      get_fixture_file('sample_response.json')
    end

end