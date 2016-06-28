module Shoegaze
  class Implementation
    attr_reader :scenarios

    def initialize(mock_class, scope, method_name, &block)
      @_mock_class  = mock_class
      @_scope       = scope
      @_method_name = method_name
      @scenarios    = {}

      self.instance_eval(&block)
    end

    def scenario(scenario_name, &block)
      @scenarios[scenario_name] = Scenario.new(@_method_name, &block)
    end

    def default(&block)
      @scenarios[:default] = scenario = Scenario.new(@_method_name, &block)

      scenario_orchestrator = ScenarioOrchestrator.new(@_mock_class, @_scope, @_method_name)

      @_mock_class.send(
        defining_method, @_method_name, proc do
          scenario_orchestrator.execute_scenario(scenario)
        end
      )
    end

    private

    def defining_method
      case @_scope
      when :class
        :define_singleton_method
      when :instance
        :define_method
      end
    end
  end
end