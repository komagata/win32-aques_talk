require 'test_helper'

class AquesTalkTest < Test::Unit::TestCase
	context "synthe method" do
    should "return not nil when given hiragana" do
      res, size = AquesTalk.synthe("これわてすとですね？", 70)
      assert_not_nil res
  	end

    should "return nil when given english" do
      res, size = AquesTalk.synthe("foo", 70)
      assert_nil res
    end
	end

	context "free_wave method" do
    should "return nil when given valid data" do
      res, size = AquesTalk.synthe("これわてすとですね？", 70)
      assert_nil AquesTalk.free_wave(res)
  	end

		should "return nil when given invalid data" do
      res, size = AquesTalk.synthe("bar", 70)
      assert_nil AquesTalk.free_wave(res)
  	end
	end

	context "play_sync method" do
    should "return 0 when given valid message" do
  		assert_equal 0, AquesTalk.play_sync("これわてすとですか？", 70)
  	end

    should "return not 0 when given invalid message" do
  		assert_not_equal 0, AquesTalk.play_sync("bar", 70)
  	end
	end

	should "create method return not nil" do
    assert_not_nil AquesTalk.create
	end

	should "release method return nil" do
		h_me = AquesTalk.create
    assert_nil AquesTalk.release(h_me)
	end

  context "play method" do
    should "return 0 when given valid arguments" do
			h_me = AquesTalk.create
      assert_equal 0, AquesTalk.play(h_me, "これわてすとですか？")
  	end

    should "return not 0 when given invalid arguments" do
			h_me = AquesTalk.create
      assert_not_equal 0, AquesTalk.play(h_me, "foo")
  	end
  end

	should "stop method return nil" do
    h_me = AquesTalk.create
    AquesTalk.play(h_me, "これわてすとですか？")
		sleep 1
    assert_nil AquesTalk.stop(h_me)
	end

  context "is_play method" do
    should "return 1 when playing" do
      h_me = AquesTalk.create
      AquesTalk.play(h_me, "これわてすとですか？")
		  sleep 1
      assert_equal 1, AquesTalk.is_play(h_me)
	  end

    should "return 0 when not playing" do
      h_me = AquesTalk.create
      AquesTalk.play(h_me, "これわてすとですか？")
		  sleep 1
      AquesTalk.stop(h_me)
      assert_equal 0, AquesTalk.is_play(h_me)
	  end
	end
end
