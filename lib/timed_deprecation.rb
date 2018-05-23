require "rubygems"
require "timed_deprecation/version"
require "active_support/deprecation"

class TimedDeprecation
  include ActiveSupport::Deprecation::Reporting

  def initialize(reason, owner:, reconsider_after: nil, &block)
    @reason = reason
    @owner = owner
    @reconsider_after = reconsider_after

    yield if block

    warn(message) if active?
  end

  def behavior
    ActiveSupport::Deprecation.behavior
  end

  private

  def active?(date = Date.today)
    !@reconsider_after || @reconsider_after <= date
  end

  def message
    "#{@reason} [Owner: #{@owner}]"
  end
end
