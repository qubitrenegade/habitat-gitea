# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/
pkg_name=gitea
pkg_origin=qubitrenegade
# pkg_version=latest
pkg_version=1.4.2
pkg_maintainer="QubitRenegade <qubitrenegade@gmail.com>"
pkg_license=("MPL-2.0")
# pkg_source=code.gitea.io/gitea
# pkg_source=https://github.com/go-gitea/${pkg_name}
# pkg_source=https://github.com/go-gitea/${pkg_name}/archive/v${pkg_version}.tar.gz
pkg_source=https://dl.gitea.io/${pkg_name}/${pkg_version}/${pkg_name}-${pkg_version}-linux-amd64
pkg_filename=${pkg_name}
pkg_shasum=c843d462b5edb0d64572b148a0e814e41d069d196c3b3ee491449225e1c39d7d
pkg_bin_dirs=(bin)
pkg_deps=(core/bash core/git)
# pkg_build_deps=(core/make core/coreutils)
# pkg_scaffolding=core/scaffolding-go


# Optional.
# An array of paths, relative to the final install of the software, where
# libraries can be found. Used to populate LD_FLAGS and LD_RUN_PATH for
# software that depends on your package.
# pkg_lib_dirs=(lib)


# Optional.
# An array of paths, relative to the final install of the software, where
# headers can be found. Used to populate CFLAGS for software that depends on
# your package.
# pkg_include_dirs=(include)


# Optional.
# An array of paths, relative to the final install of the software, where
# pkg-config metadata (.pc files) can be found. Used to populate
# PKG_CONFIG_PATH for software that depends on your package.
# pkg_pconfig_dirs=(lib/pconfig)

# Optional.
# An associative array representing configuration data which should be gossiped to peers. The keys
# in this array represent the name the value will be assigned and the values represent the toml path
# to read the value.
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )


# Optional.
# An array of `pkg_exports` keys containing default values for which ports that this package
# exposes. These values are used as sensible defaults for other tools. For example, when exporting
# a package to a container format.
# pkg_exposes=(port ssl-port)


# Optional.
# An associative array representing services which you depend on and the configuration keys that
# you expect the service to export (by their `pkg_exports`). These binds *must* be set for the
# Supervisor to load the service. The loaded service will wait to run until it's bind becomes
# available. If the bind does not contain the expected keys, the service will not start
# successfully.
# pkg_binds=(
#   [database]="port host"
# )


# Optional.
# Same as `pkg_binds` but these represent optional services to connect to.
# pkg_binds_optional=(
#   [storage]="port host"
# )

# Optional.
# The user to run the service as. The default is hab.
# pkg_svc_user="hab"


# Optional.
# The group to run the service as. The default is hab.
# pkg_svc_group="$pkg_svc_user"


pkg_description="Gitea Git Source Hosting"
pkg_upstream_url="https://github.com/go-gitea/gitea"

do_unpack() {
  return 0
}

do_prepare() {
  return 0
}

do_build() {
  cd $HAB_CACHE_SRC_PATH
  chmod +x ${pkg_name}
}

do_install() {
  cd $HAB_CACHE_SRC_PATH
  install -D ${pkg_name} -d ${pkg_prefix}/bin/${pkg_name}
}
