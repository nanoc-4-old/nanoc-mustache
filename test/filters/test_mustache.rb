# encoding: utf-8

require 'helper'

class Nanoc::Mustache::FilterTest < Minitest::Test

  def test_filter
    # Create item
    item = Nanoc::Item.new(
      'content',
      { :title => 'Max Payne', :protagonist => 'Max Payne' },
      '/games/max-payne/'
    )

    # Create filter
    filter = ::Nanoc::Mustache::Filter.new({ :item => item })

    # Run filter
    result = filter.run('The protagonist of {{title}} is {{protagonist}}.')
    assert_equal('The protagonist of Max Payne is Max Payne.', result)
  end

  def test_filter_with_yield
    # Create item
    item = Nanoc::Item.new(
      'content',
      { :title => 'Max Payne', :protagonist => 'Max Payne' },
      '/games/max-payne/'
    )

    # Create filter
    filter = ::Nanoc::Mustache::Filter.new(
      { :content => 'No Payne No Gayne', :item => item })

    # Run filter
    result = filter.run('Max says: {{yield}}.')
    assert_equal('Max says: No Payne No Gayne.', result)
  end

end
