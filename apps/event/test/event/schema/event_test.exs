defmodule Event.Schema.EventTest do
  use ExUnit.Case
  @params %{ title: "test event", description: "test description", start_datetime: "2016-06-06 20:00:00", end_datetime: "2016-06-08 23:00:00" }

  test "insert valid event" do
    assert {:ok, _} = Event.Schema.Event.build(@params) |> Event.Repo.insert
  end

  test "invalid datetime" do
    changeset = Event.Schema.Event.build(%{ @params | end_datetime: "2016-05-05 20:00:00" })
    assert Keyword.get(changeset.errors, :start_datetime) == {"Invalid date", []}
  end
end