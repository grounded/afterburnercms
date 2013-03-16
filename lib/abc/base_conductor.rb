module Abc
  class ResponseNotSpecifiedError < StandardError; end
  class DataNotSpecifiedError < StandardError; end
  # The Base Conductor is the conductor that all other conductors inherit from.
  # Its primary role is to decipher the parameters, retrieve or save data to
  # or from data-facing APIs like a database or a third-party API, and to 
  # optionally wrap what it plans to return in an object that provides methods
  # for access (in some cases, abstracting complex logic away from the view).
  #
  # The Conductor is not responsible, however, for validating or wrapping the
  # data it retrieves. That task is delegated down to the application.
  class BaseConductor
    class << self
      # Runs the conductor and returns a hash of objects (presenter or
      # otherwise) that are passed to the view.
      #
      # @param params [HashWithIndifferentAccess] The request parameters.
      # @param options [Hash] A series of options that override default values.
      # @return [Hash] An associative array of presenter objects to be passed to the view.
      def call(params, options = {})
        new(params, options).to_response
      end
    end

    # Transforms the data returned by the #data method into an acceptable format
    # to return to the controller. Primarily used to wrap data in presenters, but
    # can pass entities back, too.
    #
    # @return [Hash] An associative array of presenter or entity objects to be passed to the view.
    def to_response
      raise ResponseNotSpecifiedError, "#to_response must be overridden when subclassing BaseConductor"
    end

    protected
    attr_accessor :params, :options

    def initialize(params, options = {})
      self.params = params
      self.options = defaults.merge(options)
    end

    # Passes data retrieved from somewhere down to Interactors and returns something
    # to be wrapped by #to_response -- by convention, an associative array.
    # 
    # This method can also assume responsibility for retrieving objects, but it may
    # choose to delegate that to other methods of this class.
    #
    # @return [Object] Data to be wrapped to send in response to the request.
    def data
      raise DataNotSpecifiedError, "#data must be overridden when subclassing BaseConductor."
    end

    # Provides a frozen hash of sane defaults that can be overridden to change class
    # behaviour. Highly useful for dependency injection to simplify testing. For
    # instance, instead of hard-coding a repository object, specify a default for it
    # so that you can pass in a mock when testing.
    #
    # @return [Hash] An associative array of defaults.
    def defaults
      Hash.new.freeze
    end
  end
end
