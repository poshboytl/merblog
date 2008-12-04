# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb_paginate}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Herald"]
  s.autorequire = %q{merb_paginate}
  s.date = %q{2008-12-04}
  s.description = %q{A pagination library for Merb that uses will_paginate internally}
  s.email = %q{nathan@myobie.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/merb_paginate", "lib/merb_paginate/core_ext.rb", "lib/merb_paginate/finders", "lib/merb_paginate/finders/activerecord.rb", "lib/merb_paginate/finders/datamapper.rb", "lib/merb_paginate/finders/generic.rb", "lib/merb_paginate/finders/sequel.rb", "lib/merb_paginate/finders.rb", "lib/merb_paginate/view_helpers.rb", "lib/merb_paginate.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/myobie/merb_paginate}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A pagination library for Merb that uses will_paginate internally}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-core>, [">= 0.9"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 2.2.0"])
    else
      s.add_dependency(%q<merb-core>, [">= 0.9"])
      s.add_dependency(%q<will_paginate>, [">= 2.2.0"])
    end
  else
    s.add_dependency(%q<merb-core>, [">= 0.9"])
    s.add_dependency(%q<will_paginate>, [">= 2.2.0"])
  end
end
