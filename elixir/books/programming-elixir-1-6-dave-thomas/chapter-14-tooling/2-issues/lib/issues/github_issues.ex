defmodule Issues.GithubIssues do
  require Logger

  @user_agent [{"User-agent", "learning-elixir/1.0"}]

  def fetch(user, project) do
    Logger.info("Fetching #{user}'s project #{project}")

    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  # Using a module attribute to fetch the value at compile time
  @github_url Application.get_env(:issues, :github_url)

  def issues_url(user, project), do: "#{@github_url}/repos/#{user}/#{project}/issues"

  def handle_response({_, %{status_code: status_code, body: body}}) do
    {
      status_code |> check_status_code,
      body |> Poison.Parser.parse!()
    }
  end

  def check_status_code(200), do: :ok
  def check_status_code(_), do: :error
end
