Gem::Specification.new do |s|
  s.name = 'tkxs-component-generator'
  s.version = '0.1.1'
  s.summary = 'Command line Eventide component generator'
  s.description = ' '

  s.authors = %w(TKXS johnallen3d)
  s.email = %w(techops@technekes john.allen@tkxs.com)
  s.homepage = 'https://github.com/technekes/command-line-component-generator'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib,source}/**/*', File::FNM_DOTMATCH)
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4.0'

  s.bindir = 'executable'
  s.executables = Dir.glob('executable/*').map(&File.method(:basename))

  s.add_runtime_dependency 'evt-casing'
  s.add_runtime_dependency 'thor'
end
