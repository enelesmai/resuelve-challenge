module Helpers

   def get_fixture_file(filename, use_symbols = false)
      content = file_fixture(filename).read
      JSON.parse(content, symbolize_names: use_symbols)
   end

   def sample_request_json
      get_fixture_file('sample_request.json')
    end
   
   def sample_response_json
     get_fixture_file('sample_response.json')
   end

end