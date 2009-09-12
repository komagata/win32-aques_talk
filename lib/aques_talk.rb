require "ffi"
require "aques_talk/aques_talk"
require "aques_talk/aques_talk_da"


module AquesTalk
  class << self
    # Create wave data from string.
    # == Arguments
    # * <tt>message</tt> - Hiragana string. 
    # * <tt>speed</tt> - talk speed. 
    # == Retrun
    # * <tt>[res, size_p]</tt> - resutls array.
    # == Original C function signature
    #   unsigned char * AquesTalk_Synthe(const char *koe, int iSpeed, int *size) 
    def synthe(message, speed = 100)
      size_p = FFI::MemoryPointer.new(:int)
  		res = AquesTalk.synthe(message, speed, size_p)
			[res, size_p]
    end
  
  	def free_wave(wav)
  		AquesTalk.free_wave(wav)
  	end
  
  	def play_sync(message, speed = 100)
  		AquesTalkDa.play_sync(message, speed)
  	end
  
  	def create
  		AquesTalkDa.create
  	end

    def release(h_me)
  		AquesTalkDa.release(h_me)
  	end

  	def play(h_me, message, speed = 100, h_wnd = nil, msg = 0, dw_user = 0)
  		AquesTalkDa.play(h_me, message, speed, h_wnd, msg, dw_user)
  	end
  
  	def stop(h_me)
  		AquesTalkDa.stop(h_me)
  	end
  
  	def is_play(h_me)
  		AquesTalkDa.is_play(h_me)
  	end
	end
end
