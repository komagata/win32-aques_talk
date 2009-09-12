require "ffi"

module AquesTalk
  module AquesTalk
    extend FFI::Library
    ffi_lib File.join(File.dirname(__FILE__), "..", "..", "vendor", "aques_talk", "lib", "AquesTalk.dll")
  
    # unsigned char * AquesTalk_Synthe(const char *koe, int iSpeed, int *size) 
    attach_function :synthe, :AquesTalk_Synthe, [:string, :int, :pointer], :string
  
    # void AquesTalk_FreeWave (unsigned char *wav)
    attach_function :free_wave, :AquesTalk_FreeWave, [:string], :void
  end
end
