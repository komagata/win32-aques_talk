require "ffi"

module AquesTalkDa
  extend FFI::Library
  ffi_lib File.join(File.dirname(__FILE__), "..", "vendor", "aques_talk", "lib", "AquesTalkDa.dll")

	# int AquesTalkDa_PlaySync(const char *koe, int iSpeed=100) 
  attach_function :play_sync, :AquesTalkDa_PlaySync, [:string, :int], :int

	# H_AQTKDA  AquesTalkDa_Create()
  attach_function :create, :AquesTalkDa_Create, [], :int

	# void AquesTalkDa_Release(H_AQTKDA hMe)
  attach_function :release, :AquesTalkDa_Release, [], :void
	
	# int AquesTalkDa_Play(H_AQTKDA hMe, const char *koe, int iSpeed=100, HWND hWnd=0, unsigned long msg=0, unsigned long dwUser=0) 
  attach_function :play, :AquesTalkDa_Play, [:int, :string, :int, :int, :long, :long], :void
	
	# void AquesTalkDa_Stop(H_AQTKDA hMe)
  attach_function :stop, :AquesTalkDa_Stop, [:int], :void
	
	# int AquesTalkDa_IsPlay(H_AQTKDA hMe) 
  attach_function :is_play, :AquesTalkDa_IsPlay, [:int], :int
end
