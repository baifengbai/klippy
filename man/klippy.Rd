% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/klippy.R
\name{klippy}
\alias{klippy}
\title{Insert copy to clipboard buttons in HTML documents}
\usage{
klippy(lang = c("r", "markdown"), all_precode = FALSE, position = c("top",
  "left"), color = "auto", tooltip_message = "Copy code",
  tooltip_success = "Copied!")
}
\arguments{
\item{lang}{A character string or a vector of character strings with
language names. If a character string contains multiple languages
names, these names have to be separated by boundaries (e.g., spaces).
Void string can be passed to \code{lang} argument.}

\item{all_precode}{A logical scalar. If \code{TRUE}, a "klippy" is
added to all \code{HTML <pre>} elements having an \code{HTML <code>}
element as a child.}

\item{position}{A character vector with \code{klippy} position.
Accepted values are "top", "bottom", "left" and "right".
Abbreviated forms are allowed.}

\item{color}{String of any of the three kinds of \code{R} color
specifications, i.e., either a color name (as listed by
\code{\link[grDevices]{colors}()}), a hexadecimal string of the form
\code{"#rrggbb"} or \code{"#rrggbbaa"}
(see \code{\link[grDevices]{rgb}()}), or a positive integer \code{i}
meaning \code{\link[grDevices]{palette}()[i]}. Default value is
\code{"auto"}: color is set to the anchor color of the document.}

\item{tooltip_message}{String with the tooltip message.}

\item{tooltip_success}{String with the tooltip message shown when
code is successfully copied.}
}
\value{
An HTML tag object that can be rendered as HTML using
\code{\link{as.character}()}.
}
\description{
\code{klippy} insert copy to clipboard buttons (or "klippies") in \code{R}
\code{Markdown} \code{HTML} documents. In the rendered document, "klippies"
are inserted in the upper left corner of the code chunks. \code{klippy()}
function is suited for a call in a \code{knitr} code chunk.
}
\details{
\code{klippy()} function appends \code{JavaScript} functions and \code{CSS} in
the rendered document that:
\enumerate{
\item Add \code{klippy} to the class attribute of selected \code{<pre>}
elements.
\item Add a \code{<button>} element (a "klippy") as a child for all
\code{<pre>} elements with a \code{klippy} class attribute.
\item Instantiate \code{clipboard.js} event listeners and attach them to
\code{klippies}.}
\code{klippy} class can also be appended to a \code{<pre>} element using
\href{https://yihui.name/knitr/options/}{\code{knitr class.source} chunk
option}. "Klippy" buttons are not rendered if the browser does not support
\code{clipboard.js} library (see \href{https://clipboardjs.com/}{here} for
details).
}
\examples{
tf <- tempfile(fileext = c(".Rmd", ".html"))
writeLines(
  c("```{r klippy, echo=FALSE, include=TRUE}",
    "klippy::klippy()",
    "```",
    "Insert this chunk in your `Rmd` file:",
    "````markdown",
    "`r ''````{r klippy, echo=FALSE, include=TRUE}",
    "klippy::klippy()",
    "```",
    "````"
  ),
  tf[1]
)

\dontrun{
rmarkdown::render(tf[1], "html_document", tf[2])
browseURL(paste0("file://", tf[2]))}


}
