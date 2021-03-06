require 'shoes/common_methods'

module Shoes
  class EditLine
    include Shoes::CommonMethods

    attr_reader :gui, :blk, :parent, :text

    def initialize(parent, opts = {}, blk = nil)
      @parent = parent
      @blk = blk
      @app = opts[:app]

      @gui = Shoes.configuration.backend_for(self, @parent.gui, blk)
      @parent.add_child self
    end

    def focus
      @gui.focus
    end

    def text=(value)
      @gui.text = value
    end
  end
end
