# encoding: utf-8

require 'mustache'

module Nanoc::Mustache

  class Filter < Nanoc::Filter

    identifier :mustache

    def run(content, params={})
      context = item.attributes.merge({ :yield => assigns[:content] })
      ::Mustache.render(content, context)
    end

  end

end
