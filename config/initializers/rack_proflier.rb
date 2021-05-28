Rack::MiniProfiler.config.pre_authorize_cb = lambda { |_env| ENV['RACK_MINI_PROFILER'] == 'on' }
