class EpisodesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "subscribed channel callback streamfrom getting called"
    stream_from "episodes_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
