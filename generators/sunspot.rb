module Padrino
  module Generators
    class SunspotGenerator < Thor::Group

      Padrino::Generators.add_generator(:sunspot, self)

      def self.source_root; File.expand_path(File.dirname(__FILE__)); end
      def self.banner; "padrino-gen sunspot"; end

      include Thor::Actions
      include Padrino::Generators::Actions

      desc "Description:\n\n\tpadrino-gen sunspot generates a default configuration for Sunspot"

      class_option :root, :desc => 'The root destination', :aliases => '-r', :default => '.', :type => :string

      ##
      # Execute Sunspot config generation
      #
      def create_sunspot
        return unless valid_config_for?

        template 'templates/sunspot.yml', destination_root('config/sunspot.yml')
      end

      private

      ##
      # Validate model characteristics
      # Alert if the configuration file already exists
      #
      def valid_config_for?
        self.destination_root = options[:root]
        return false unless correct_path?

        return false if config_file_exists?

        true
      end

      ##
      # Check app path
      #
      def correct_path?
        return true if in_app_root?
        say 'You are not at the root of a Padrino application! (config/boot.rb not found)'
        false
      end

      def config_file_exists? 
        return true unless File.exists? destination_root('config/sunspot.yml')
        say 'An existing Sunspot configuration file was found!'
        false
      end
    end    
  end
end
