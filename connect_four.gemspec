Gem::Specification.new do |s|
  s.name        = 'connect_four'
  s.version     = '0.1.0'
  s.date        = '2018-05-28'
  s.summary     = "Multiplayer Connect Four"
  s.description = "A multiplayer Connect Four game"
  s.authors     = ["Christoph Weegen"]
  s.email       = 'christophweegen@googlemail.com'
  s.files       = Dir.glob("lib/**/*")
  s.executables << 'connect_four'
  s.homepage    = 'https://github.com/christophweegen/connect_four'
  s.license       = 'MIT'
end
