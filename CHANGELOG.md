# Changelog

## [1.6.2](https://github.com/entur/gha-meta/compare/v1.6.1...v1.6.2) (2025-11-27)


### Bug Fixes

* fixes output on release_type: manifest ([#81](https://github.com/entur/gha-meta/issues/81)) ([fa1d90a](https://github.com/entur/gha-meta/commit/fa1d90ada108eb32e868f8c590184f34f1c4491a))

## [1.6.1](https://github.com/entur/gha-meta/compare/v1.6.0...v1.6.1) (2025-11-03)


### Bug Fixes

* Conditionally support release using "advanced workflow" ([#79](https://github.com/entur/gha-meta/issues/79)) ([e786802](https://github.com/entur/gha-meta/commit/e786802f9000fb28a23f8344031afc88bdbf3bc1))

## [1.6.0](https://github.com/entur/gha-meta/compare/v1.5.1...v1.6.0) (2025-10-07)


### Features

* Added more release outputs and fixed code logic ([#75](https://github.com/entur/gha-meta/issues/75)) ([cdfdde6](https://github.com/entur/gha-meta/commit/cdfdde635a75d0cd6620e2e9c7666662b03d03d1))

## [1.5.1](https://github.com/entur/gha-meta/compare/v1.5.0...v1.5.1) (2025-10-02)


### Bug Fixes

* Reduced char limit in the cloud-auth branch and repo name length check ([f8e8dd7](https://github.com/entur/gha-meta/commit/f8e8dd78aea883946c35eaee96d6b388322b67e0))
* Reduced char limit in the cloud-auth branch and repo name length… ([#73](https://github.com/entur/gha-meta/issues/73)) ([f8e8dd7](https://github.com/entur/gha-meta/commit/f8e8dd78aea883946c35eaee96d6b388322b67e0))

## [1.5.0](https://github.com/entur/gha-meta/compare/v1.4.0...v1.5.0) (2025-06-27)


### Features

* add support for docker login to europe-west1 GAR repositories ([#64](https://github.com/entur/gha-meta/issues/64)) ([dcbb1af](https://github.com/entur/gha-meta/commit/dcbb1af59d058419f6cc56062252bbdd38820a4d))

## [1.4.0](https://github.com/entur/gha-meta/compare/v1.3.1...v1.4.0) (2025-05-22)


### Features

* Added release_created output to release workflow ([#61](https://github.com/entur/gha-meta/issues/61)) ([#62](https://github.com/entur/gha-meta/issues/62)) ([f67059b](https://github.com/entur/gha-meta/commit/f67059b5471dc61feb467df0604e0daa18a521e2))

## [1.3.1](https://github.com/entur/gha-meta/compare/v1.3.0...v1.3.1) (2025-05-14)


### Bug Fixes

* add issues: write permission ([#59](https://github.com/entur/gha-meta/issues/59)) ([8eddf44](https://github.com/entur/gha-meta/commit/8eddf44ab2c39c0f2a79a64cac08eba2d89cd7f1))

## [1.3.0](https://github.com/entur/gha-meta/compare/v1.2.0...v1.3.0) (2025-03-20)


### Features

* allow release_type and path input ([#55](https://github.com/entur/gha-meta/issues/55)) ([022fc84](https://github.com/entur/gha-meta/commit/022fc84355eb19ba6970c32d199dd468cfcdb99a))

## [1.2.0](https://github.com/entur/gha-meta/compare/v1.1.9...v1.2.0) (2024-11-04)


### Features

* new verify-pr reusable workflow to check commit messages and pr title follow Conventional Commits Spec ([#48](https://github.com/entur/gha-meta/issues/48)) ([2247f7a](https://github.com/entur/gha-meta/commit/2247f7a64bad8d2e3674fe8d68669fc81fb4d068))

## [1.1.9](https://github.com/entur/gha-meta/compare/v1.1.8...v1.1.9) (2024-08-26)


### Bug Fixes

* update to use latest version of get-gke-credentials ([#42](https://github.com/entur/gha-meta/issues/42)) ([180bfd0](https://github.com/entur/gha-meta/commit/180bfd0c8c3a02ba1c3f0551c0a2b800542e737e))

## [1.1.8](https://github.com/entur/gha-meta/compare/v1.1.7...v1.1.8) (2024-06-02)


### Bug Fixes

* add checks ([2dbe15b](https://github.com/entur/gha-meta/commit/2dbe15b0b3744c09371b55edc1909c7eaf80065f))
* input names ([a9358eb](https://github.com/entur/gha-meta/commit/a9358eb054a2704040d5bb5ea4601232b02768b1))
* print changed files and ff-only on pull ([4226a5d](https://github.com/entur/gha-meta/commit/4226a5d1a58cf652ef968f32897ff1312374eed0))
* revert back to use latest, tag issue? ([f90485e](https://github.com/entur/gha-meta/commit/f90485e7ea30eebcf7639299f0e84d437879d741))
* test token ([b1ee442](https://github.com/entur/gha-meta/commit/b1ee4426a8a5598bf8217aa47098f759d2716cbc))

## [1.1.7](https://github.com/entur/gha-meta/compare/v1.1.6...v1.1.7) (2024-05-30)


### Bug Fixes

* consistent naming, cluster location, remove unsupported type: input, prevent string injection ([e55adcf](https://github.com/entur/gha-meta/commit/e55adcfbfee0a595e4b60bd65a05cc12f892aa1b))
* defaults ([1935c05](https://github.com/entur/gha-meta/commit/1935c05bf95875db37dd993d36d9f21a53b4a92b))
* match az/gcp ([#32](https://github.com/entur/gha-meta/issues/32)) ([1e4fbcd](https://github.com/entur/gha-meta/commit/1e4fbcd0457940f68ba19bfb5623a7abf7914e6e))
* var name change ([04b3be1](https://github.com/entur/gha-meta/commit/04b3be19cbdf5f8f56d04de8dafb88fed9d4144e))

## [1.1.6](https://github.com/entur/gha-meta/compare/v1.1.5...v1.1.6) (2024-05-27)


### Bug Fixes

* permissions ([ff4b793](https://github.com/entur/gha-meta/commit/ff4b7936dd84b1dbff71974c0045703ebb013b10))
* permissions ([#30](https://github.com/entur/gha-meta/issues/30)) ([3f8293c](https://github.com/entur/gha-meta/commit/3f8293cb0428303f3706aa2fed0edf8583504d4c))

## [1.1.5](https://github.com/entur/gha-meta/compare/v1.1.4...v1.1.5) (2024-05-24)


### Bug Fixes

* write all perm ([5c4d168](https://github.com/entur/gha-meta/commit/5c4d1687c77b390dc94869e790084dd558e709ba))
* write all perm ([#28](https://github.com/entur/gha-meta/issues/28)) ([071e2bf](https://github.com/entur/gha-meta/commit/071e2bfd84224bf3f1c989c244fa1b60330d424f))

## [1.1.4](https://github.com/entur/gha-meta/compare/v1.1.3...v1.1.4) (2024-05-24)


### Bug Fixes

* release please ([998164a](https://github.com/entur/gha-meta/commit/998164aafe2124bb277053516b96e71ad6a2d4cf))
* release please ([5c367e4](https://github.com/entur/gha-meta/commit/5c367e42797c2c490dc6b6452b0db12e8baf3648))
* release please ([#25](https://github.com/entur/gha-meta/issues/25)) ([4498cf9](https://github.com/entur/gha-meta/commit/4498cf949d08920d5d429f773cfc3109c04080b4))
* release please ([#26](https://github.com/entur/gha-meta/issues/26)) ([bcbeba2](https://github.com/entur/gha-meta/commit/bcbeba235d96988380316edd65a033ebb3c0171e))

## [1.1.3](https://github.com/entur/gha-meta/compare/v1.1.2...v1.1.3) (2024-05-24)


### Bug Fixes

* workflow_call ([fb0e042](https://github.com/entur/gha-meta/commit/fb0e042fc8043ad7172d8624a05657bd2f7f3459))
* workflow_call ([#23](https://github.com/entur/gha-meta/issues/23)) ([1cd323b](https://github.com/entur/gha-meta/commit/1cd323b50b6e0c48996f094cb57a26ef4ae94233))
* pin ubuntu ([41b65ca](https://github.com/entur/gha-meta/commit/41b65ca7a7b83f3babcdf6f19a251313edba8c4b))
* pin ubuntu ([#21](https://github.com/entur/gha-meta/issues/21)) ([74b807f](https://github.com/entur/gha-meta/commit/74b807fdf749d3e1886dfe496d40fcf5cdbe4227))
* set timeout ([#18](https://github.com/entur/gha-meta/issues/18)) ([bccc7bd](https://github.com/entur/gha-meta/commit/bccc7bd84ce2092164e2b28925c21483ad1e9b08))
* set timeout_minutes ([bcd3530](https://github.com/entur/gha-meta/commit/bcd3530f8bcdbcefd21d20f375aa548d8e96cfdb))
* set timeout_minutes ([4ac8cbd](https://github.com/entur/gha-meta/commit/4ac8cbded9391d74d33b40a1490c82c0396f4953))
* set timeout_minutes ([#19](https://github.com/entur/gha-meta/issues/19)) ([fa573d9](https://github.com/entur/gha-meta/commit/fa573d9cad24801bacd0ed77fb6aaefb312cee1c))
* set timeout_minutes ([#20](https://github.com/entur/gha-meta/issues/20)) ([9971dc0](https://github.com/entur/gha-meta/commit/9971dc05deeb26a1803ec98a6086f01ca4e6d5e8))

## 1.1.2 [REDACTED]

## [1.1.1](https://github.com/entur/gha-meta/compare/v1.1.0...v1.1.1) (2024-05-07)


### Bug Fixes

* **k8s-auth:** allow custom project and cluster ([d0b2a83](https://github.com/entur/gha-meta/commit/d0b2a838132de90da5ba9795af3cd3fa28471d4b))
* **k8s-auth:** allow custom project and cluster ([#11](https://github.com/entur/gha-meta/issues/11)) ([2aa698d](https://github.com/entur/gha-meta/commit/2aa698d9d16a0a4fa5607f2f695217ae4763dbad))

## [1.1.0](https://github.com/entur/gha-meta/compare/v1.0.0...v1.1.0) (2024-04-30)


### Features

* refactor common auth patterns ([#8](https://github.com/entur/gha-meta/issues/8)) ([5eb90ff](https://github.com/entur/gha-meta/commit/5eb90fffb08de1b8cff73f248050c39200f425b7))


## 1.0.0 (2024-03-14)


### Bug Fixes

* use ci moniker for local verification ([474840f](https://github.com/entur/gha-meta/commit/474840f37d75e888bcd60dbbae1ba22057f8aa51))
* use the ci moniker ([72798ec](https://github.com/entur/gha-meta/commit/72798eccb61cef5f07f0bff552ead3dd51f3cd72))
