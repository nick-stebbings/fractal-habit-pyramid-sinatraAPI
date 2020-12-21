require "dry/system/container"
require "dry/system/components"

module Hht
  class Container < Dry::System::Container
    configure do
      config.name = :hht
      config.default_namespace = "hht"
      config.auto_register = %w[lib/hht lib/hht/Repos]
    end

    register "node_repo" do
      Hht::Repos::NodeRepo.new
    end

    load_paths! "lib"
  end
end