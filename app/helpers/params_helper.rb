module ParamsHelper
  def path_for(path, query = {})
    URI::HTTP.build( path:  path, query: query.to_param).request_uri.gsub(/\?$/, '')
  end

  def self_link
    request.base_url + path_for(request.path_info, declared(request.params))
  end
end
