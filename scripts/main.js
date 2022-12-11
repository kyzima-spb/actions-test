async function getLatestVersion(api, owner, repo) {
  const resp = await api.repos.listReleases({owner, repo})
  const versions = resp.data.map(r => r.name)
  versions.sort()
  return versions[versions.length - 1]
}


module.exports = async ({ github, core }) => {
  const latest = await getLatestVersion(github.rest, 'just-containers', 's6-overlay')
  core.setOutput('value', latest)
}