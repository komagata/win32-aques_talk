require "ffi"

module AquesTalk
  extend FFI::Library
  ffi_lib File.join(File.dirname(__FILE__), "..", "vendor", "aques_talk", "lib", "AquesTalk.dll")
  attach_function :play_sync, :AquesTalkDa_PlaySync, [:string, :int], :int
end
