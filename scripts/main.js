async function getLatestVersion(api, owner, repo) {
  const resp = await api.repos.listReleases({owner, repo})
  const data = resp.data
  
  data.sort((a, b) => {
    if (a.tag_name < b.tag_name) {
      return 1
    }
    if (a.tag_name > b.tag_name) {
      return -1
    }
    return 0
  })
  
  return data[data.length - 1]
}


module.exports = async ({ github, core }) => {
  const latest = await getLatestVersion(github.rest, 'just-containers', 's6-overlay')
  console.log(latest)
  core.setOutput('value', latest.tag_name)
}