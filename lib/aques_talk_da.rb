require "ffi"

module AquesTalkDa
  extend FFI::Library
  ffi_lib File.join(File.dirname(__FILE__), "..", "vendor", "aques_talk", "lib", "AquesTalkDa.dll")
  attach_function :play_sync, :AquesTalkDa_PlaySync, [:string, :int], :int
end
