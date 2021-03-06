#' @export
set_plot_options <- function(...) {
    .Deprecated('options', msg = 'use the `repr.plot.*` options from the repr package instead')
    opts <- list(...)
    names(opts) <- paste0('repr.plot.', names(opts))
    do.call(options, opts)
}

#' @export
get_plot_options <- function() {
    .Deprecated('getOption', msg = 'use the `repr.plot.*` options from the repr package instead')
    all.opts <- options()
    plot.opt.idx <- grep('^repr.plot', names(all.opts))
    plot.opts <- all.opts[plot.opt.idx]
    names(plot.opts) <- gsub('^repr\\.plot\\.', '', names(plot.opts))
    return(as.list(plot.opts))
}

opt.defaults <- list(
    jupyter.plot_mimetypes = c(
        'text/plain',
        'image/png',
        'image/svg+xml'))

.onLoad <- function(libname = NULL, pkgname = NULL) {
    for (option in names(opt.defaults)) {
        if (is.null(getOption(option))) {
            do.call(options, opt.defaults[option])  # single []: preserve name
        }
    }
}
