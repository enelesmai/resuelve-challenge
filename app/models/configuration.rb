class Configuration
    include ActiveModel::Model
    attr_accessor :nivel, :meta
    attribute :nivel, :string
    attribute :meta, :integer
end