class Kamal::Commands::Builder::Local < Kamal::Commands::Builder::Base
  def create
    puts "FFFFFFFFFFFFFFFFFFFF"
    docker :buildx, :create, "--config /etc/buildkit/buildkitd.toml", "--name", builder_name, "--driver=#{driver}" unless docker_driver?
  end

  def remove
    docker :buildx, :rm, builder_name unless docker_driver?
  end

  private
    def builder_name
      "kamal-local-#{driver}"
    end
end
