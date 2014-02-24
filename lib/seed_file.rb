require 'active_record'
require 'csv'

class SeedFile

  attr_accessor :path, :model, :attributes

  def initialize(options)
    @path = options[:path]
    @model = options[:model]
  end

  def seed!
    CSV.foreach(@path, headers: true, header_converters: :symbol) do |line|
      @model.create(line.to_hash)
    end
  end

  private

  def check_for_errors
    return unless File.exist?(@path)
    return unless @model.is_a?(ActiveRecord::Base)
  end

end
