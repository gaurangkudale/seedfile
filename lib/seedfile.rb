require 'active_record'
require 'csv'

class Seedfile

  class FileNotFoundError < StandardError;end
  class InvalidModelError < StandardError;end

  attr_accessor :path, :model

  def initialize(options)
    @path = options[:path]
    @model = options[:model]
    check_for_errors
  end

  def seed
    CSV.foreach(@path, headers: true, header_converters: :symbol) do |line|
      @model.create(line.to_hash)
    end
  end

  private

  def check_for_errors
    raise FileNotFoundError unless File.exist?(@path)
    raise InvalidModelError unless @model.superclass == ActiveRecord::Base
  end

end
