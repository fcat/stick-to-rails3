lockfile_content = File.read 'Gemfile.lock'
specs = Bundler::LockfileParser.new(lockfile_content).specs

require 'yaml'
constraints = YAML.load File.read 'constraints.yml'

specs.all? do |spec|
  if constraints.has_key?(spec.name)
    constraint = constraints[spec.name]
    Gem::Requirement.new(constraint).satisfied_by?(spec.version).tap do |satisfied|
      status = satisfied ? "satisfied by" : "NOT satisfied by"
      puts "#{ spec.name }: \"#{ constraint }\" #{ status } #{ spec.version }"
    end
  else
    true
  end
end && exit(0) || exit(1)
