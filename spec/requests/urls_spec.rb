describe "Urls API" do

  describe "POST /urls" do
    let(:url_params) {{"link" => "google.com"}}
    let(:request_headers) {{"Accept" => "application/json", "Content-Type" => "application/json"}}

    it "creates a url" do
      post "/urls", url_params.to_json, request_headers

      expect(response.status).to eq 201

      response_body = JSON.parse(response.body)

      expect(response_body["link"]).to eq "google.com"
    end
  end

end
