defmodule Mix.Tasks.Docs.Ghpages do
  use Mix.Task

  @moduledoc """
  A task for uploading documentation to gh-pages.
  """

  defp run!(command) do
    if Mix.shell.cmd(command) != 0 do
      raise Mix.Error, message: "command `#{command}` failed"
    end
    :ok
  end

  def run(_) do
    File.rm_rf "docs"
    Mix.Task.run "docs"
    # First figure out the git remote to use based on the
    # git remote here.
    git_remote = Keyword.get(
        Regex.captures(%r/\: (?<git>.*)/g,
            :os.cmd 'git remote show -n origin | grep "Push  URL"'), :git)
    Mix.shell.info "Git remote #{git_remote}"
    File.cd! "docs"
    run! "git init ."
    run! "git add ."
    run! "git commit -a -m \"Generated docs\""
    run! "git remote add origin #{git_remote}"
    run! "git push origin master:gh-pages --force"
  end
end

