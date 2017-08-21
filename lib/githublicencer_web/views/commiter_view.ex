defmodule GithublicencerWeb.CommiterView do
  use GithublicencerWeb, :view





  def render("index.json", %{commiters: commiters}) do
    render_many(commiters, GithublicencerWeb.CommiterView, "commiter.json")
  end

  def render("show.json", %{commiter: commiter}) do
    %{data: render_one(commiter, GithublicencerWeb.CommiterView, "commiter.json")}
  end

  def render("commiter.json", %{commiter: commiter}) do
    %{id: commiter.id,
      email: commiter.email,
      name: commiter.name,
      github_user_id: commiter.github_user_id}
  end
end
