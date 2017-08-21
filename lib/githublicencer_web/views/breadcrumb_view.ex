defmodule GithublicencerWeb.BreadcrumbView do

	use GithublicencerWeb, :view

	def render("breadcrumbs.html", %{github_repo: github_repo, commiter: commiter, conn: conn}) do
		breadcrumbs =
			~s(<ol class="breadcrumb">
						<li><a href="#{github_repo_path(conn, :index)}">#{github_repo.owner}</a></li>
						<li><a href="#{github_repo_path(conn, :show, github_repo)}">#{github_repo.name}</a></li>
						<li class="active">#{commiter.name}</li>
			</ol>)
		raw(breadcrumbs)
	end

	def render("breadcrumbs.html", %{github_repo: github_repo, conn: conn}) do
		breadcrumbs =
			~s(<ol class="breadcrumb">
						<li><a href="#{github_repo_path(conn, :index)}">#{github_repo.owner}</a></li>
						<li><a class="active" href="#{github_repo_path(conn, :show, github_repo)}">#{github_repo.name}</a></li>
			</ol>)
		raw(breadcrumbs)
	end

	def render("breadcrumbs.html", %{owner: owner, conn: conn}) do
		breadcrumbs =
			~s(<ol class="breadcrumb">
						<li><a href="#{github_repo_path(conn, :index)}">#{owner}</a></li>
			</ol>)
		raw(breadcrumbs)
	end

end
