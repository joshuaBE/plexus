module Graphy
  # Errors
  # TODO FIXME: must review all raise lines and streamline things
  
  # Base error class for the library.
  class GraphyError < StandardError; end
  
  class NoArcError < GraphyError; end
end
