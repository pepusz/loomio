ENV["RAILS_ENV"] ||= 'test'
ROOT_PATH = ::File.expand_path('..', File.dirname(__FILE__))
$LOAD_PATH.unshift "#{ROOT_PATH}/app/decorators"
