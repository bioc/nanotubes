#' CAGE data from mouse nanotube experiment
#'
#' Overview of the mouse nanotube CAGE experiment by Bornholdt et al. This
#' experiment involved exposing mice to carbon nanotubes and performing Cap
#' Analysis of Gene Expression (CAGE) on lung biopsies. The resulting CAGE
#' Transcription Start Sites (CTSSs), the number of CAGE tag 5'-ends mapping to
#' each genomic position, are supplied as BigWig-files (on mm9).
#'
#' @format Study design as a data.frame: \describe{ \item{Class}{Experimential
#'   group (factor): Ctrl (Untreated) or Nano (Treated with nanotubes)}
#'   \item{Name}{Name of sample} \item{BigWigPlus}{BigWig-file holding
#'   plus-strand CTSSs} \item{BigWigPlus}{BigWig-file holding plus-strand CTSSs}
#'   }
#' @source \url{https://pubs.acs.org/doi/10.1021/acsnano.6b07533}
#' @examples
#' # BigWig import is only supported on non-windows platforms:
#' if (.Platform$OS.type != "windows") {
#'     library(GenomicRanges)
#'     library(rtracklayer)
#'     data(nanotubes)
#'     bw_path <- system.file("extdata",
#'                            nanotubes$BigWigMinus[1],
#'                            package="nanotubes",
#'                            mustWork = TRUE)
#' import(bw_path)
#' }
"nanotubes"
