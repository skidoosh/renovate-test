module.exports = {
  hostRules: [
    {
      hostType: 'docker',
      matchHost: 'docker.io',
      username: process.env.DOCKER_HUB_USERNAME,
      password: process.env.DOCKER_HUB_PASSWORD,
    },
  ],
};