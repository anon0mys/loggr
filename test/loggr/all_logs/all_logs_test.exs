defmodule Loggr.AllLogsTest do
  use Loggr.DataCase

  alias Loggr.AllLogs

  describe "logs" do
    alias Loggr.AllLogs.Log

    @valid_attrs %{request_body: "some request_body", request_verb: "some request_verb"}
    @update_attrs %{request_body: "some updated request_body", request_verb: "some updated request_verb"}
    @invalid_attrs %{request_body: nil, request_verb: nil}

    def log_fixture(attrs \\ %{}) do
      {:ok, log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AllLogs.create_log()

      log
    end

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert AllLogs.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert AllLogs.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      assert {:ok, %Log{} = log} = AllLogs.create_log(@valid_attrs)
      assert log.request_body == "some request_body"
      assert log.request_verb == "some request_verb"
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AllLogs.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      assert {:ok, %Log{} = log} = AllLogs.update_log(log, @update_attrs)
      assert log.request_body == "some updated request_body"
      assert log.request_verb == "some updated request_verb"
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = AllLogs.update_log(log, @invalid_attrs)
      assert log == AllLogs.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = AllLogs.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> AllLogs.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = AllLogs.change_log(log)
    end
  end
end
