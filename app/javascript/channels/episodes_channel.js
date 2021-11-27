import consumer from "./consumer"

consumer.subscriptions.create({ channel: "EpisodesChannel"}, {
  received(data){
    alert("i got some data")
  }
})
