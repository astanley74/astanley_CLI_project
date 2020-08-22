require_relative 'lib/astanley_CLI_project/version'

Gem::Specification.new do |spec|
  spec.name          = "astanley_CLI_project"
  spec.version       = AstanleyCLIProject::VERSION
  spec.authors       = ["astanley74"]
  spec.email         = ["stanley.377@buckeyemail.osu.edu"]

  spec.summary       = %q{This CLI application will return the NHL teams that are in both the Eastern and Western Conference. It will also allow a user to select a team from a conference and the roster will be displayed.}
  spec.homepage      = "https://github.com/astanley74/astanley_CLI_project.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
