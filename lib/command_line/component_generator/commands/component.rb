module CommandLine
  module ComponentGenerator
    module Commands
      class Component < Thor::Group
        include Thor::Actions

        argument :name

        def component_name
          @component_name ||= name.end_with?('_component') ? name : "#{name}_component"
        end

        def component_root_dir_name
          @component_dir_name ||= component_name.gsub('_','-')
        end

        def component_constant_name
          @component_constant_name ||= Casing::Pascal.(component_name)
        end

        def entity_name
          @entity_name ||= Casing::Underscore.(entity_constant_name)
        end

        def entity_stream_name
          @entity_stream_name ||= Casing::Camel.(entity_name)
        end

        def entity_constant_name
          @entity_constant_name ||= Casing::Pascal.(component_name.gsub('_component', ''))
        end

        def service_name
          @service_name ||= entity_name.gsub('_', '-')
        end

        def self.source_root
          File.dirname(__FILE__) + '/../../../../source'
        end

        def initialize(args=[], options={}, config={})
          super
          self.destination_root = component_root_dir_name
        end

        def generate_component
          directory('./')
        end

        def assign_executable_attribute
          chmod 'bin/release', 0755
          chmod 'bin/setup', 0755
          chmod 'bin/start', 0755
          chmod 'Rakefile', 0755
        end
      end
    end
  end
end
