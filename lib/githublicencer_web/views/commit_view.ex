defmodule GithublicencerWeb.CommitView do
  use GithublicencerWeb, :view

  def render("index.json", %{commits: commits}) do
    %{data: render_many(commits, GithublicencerWeb.CommitView, "commit.json")}
  end

  def render("show.json", %{commit: commit}) do
    %{data: render_one(commit, GithublicencerWeb.CommitView, "commit.json")}
  end

  def render("commit.json", %{commit: commit}) do
    %{id: commit.id,
      sha: commit.sha,
      pullrequest: commit.pullrequest,
      commiter: commit.commiter,
      github_repo: commit.github_repo}
  end
end
