# Override ruby Hash Obj
class Hash
  # Attr to be external accessible
  attr_accessor :get_url_params

  # Convert string keys to symbol keys
  def it_keys_to_sym
    self.keys.each do |key|
      self[key].it_keys_to_sym if self[key].is_a?(Hash)
      self[(key.to_sym rescue key) || key] = self.delete(key)
    end

    return self
  end

  # Convert it keys to get params
  def it_keys_to_get_param
    self.it_keys_to_sym
    self.get_url_params = '?'

    self.keys.each do |key|
      self.get_url_params = self.get_url_params+'&' unless self.get_url_params.length == 1

      # Nested obj_attrs
      if self[key].is_a?(Hash)
        hash_name = key
        hash_obj = self[key]

        # Hash to GET URL
        param = to_nested_get_param hash_name, hash_obj
      else
        param="#{key}=#{self[key]}"
      end

      self.get_url_params = self.get_url_params+param
    end

    # Remove the last char: &
    self.get_url_params = self.get_url_params[0..self.get_url_params.length-2] if self.get_url_params.index('\\')
    self.get_url_params
  end

  # SetUp a hash to hash URL GET
  def to_nested_get_param  hash_name, hash_obj
    # initial value
    get_nested_params = ''

    # foreach keys to mount the URL_PARAM
    hash_obj.keys.each do |key|
      key_param = hash_obj[key].to_nested_get_param key, hash_obj[key] if hash_obj[key].is_a?(Hash)
      key_param = "#{hash_name}[#{key}]=#{hash_obj[key]}&" unless hash_obj[key].is_a?(Hash)
      get_nested_params = get_nested_params+key_param
    end

    # return
    get_nested_params
  end
end