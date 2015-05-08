require 'sunspot'
require File.join(File.dirname(__FILE__), 'padrino', 'configuration')
require File.join(File.dirname(__FILE__), 'padrino', 'adapters')
require File.join(File.dirname(__FILE__), 'padrino', 'request_lifecycle')
require File.join(File.dirname(__FILE__), 'padrino', 'searchable')

module Sunspot #:nodoc:
  module Padrino #:nodoc:
    autoload :StubSessionProxy, File.join(File.dirname(__FILE__), 'padrino', 'stub_session_proxy')

    begin
      require 'sunspot_solr'
      autoload :Server, File.join(File.dirname(__FILE__), 'padrino', 'server')
    rescue LoadError
      # We're fine
    end

    class <<self
      attr_writer :configuration

      def configuration
        @configuration ||= Sunspot::Padrino::Configuration.new
      end

      def reset
        @configuration = nil
      end

      def build_session(configuration = self.configuration)
        if configuration.disabled?
          StubSessionProxy.new(Sunspot.session)
        elsif configuration.has_master?
          SessionProxy::MasterSlaveSessionProxy.new(
            SessionProxy::ThreadLocalSessionProxy.new(master_config(configuration)),
            SessionProxy::ThreadLocalSessionProxy.new(slave_config(configuration))
          )
        else
          SessionProxy::ThreadLocalSessionProxy.new(slave_config(configuration))
        end
      end

      private

      def master_config(sunspot_padrino_configuration)
        config = Sunspot::Configuration.build
        builder = sunspot_padrino_configuration.scheme == 'http' ? URI::HTTP : URI::HTTPS
        config.solr.url = builder.build(
          :host => sunspot_padrino_configuration.master_hostname,
          :port => sunspot_padrino_configuration.master_port,
          :path => sunspot_padrino_configuration.master_path,
          :userinfo => sunspot_padrino_configuration.userinfo
        ).to_s
        config.solr.read_timeout = sunspot_padrino_configuration.read_timeout
        config.solr.open_timeout = sunspot_padrino_configuration.open_timeout
        config
      end

      def slave_config(sunspot_padrino_configuration)
        config = Sunspot::Configuration.build
        builder = sunspot_padrino_configuration.scheme == 'http' ? URI::HTTP : URI::HTTPS
        config.solr.url = builder.build(
          :host => sunspot_padrino_configuration.hostname,
          :port => sunspot_padrino_configuration.port,
          :path => sunspot_padrino_configuration.path,
          :userinfo => sunspot_padrino_configuration.userinfo
        ).to_s
        config.solr.read_timeout = sunspot_padrino_configuration.read_timeout
        config.solr.open_timeout = sunspot_padrino_configuration.open_timeout
        config
      end
    end
  end
end