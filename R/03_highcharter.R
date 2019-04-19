# highcharter -------------------------------------------------------------
library(highcharter)
hc <- hchart(frequency, "scatter", hcaes(x = "Mueller", y = "Watergate", name = "word")) %>%
  hc_tooltip(pointFormat = "<b>{point.name}</b>") %>%
  hc_title(text = "Word frequencies in Mueller vs. Watergate Reports") %>%
  hc_xAxis(type = "logarithmic") %>%
  hc_yAxis(type = "logarithmic") %>%
  hc_subtitle(text = "Text from Mueller Report (2019), Watergate Special Prosecution Force Report (1975)") %>%
  hc_credits(enabled = TRUE,
             text = "by @dataandme",
             style = list(
               fontSize = "10px"
             )
  )


# palettes ----------------------------------------------------------------
tolmod_pal <- c("#77aadd",
                "#ee8866",
                "#bbcc33",
                "#eedd88",
                "#ffaabb",
                "#99ddff",
                "#dddddd")

pt_pal <- c("#ffba82",
            "#94a7c4",
            "#d85d27",
            "#8c9f97",
            "#4c6c9c")

littleowl_pal <- c("#c792ea",
                   "#addb67",
                   "#5f7e97",
                   "#f78c6c",
                   "#7fdbca",
                   "#ffeb95",
                   "#82aaff")


# hrbrish theme -----------------------------------------------------------
hrbrish <- hc_theme(
  colors = plotly::toRGB(littleowl_pal, alpha = 0.5),
  chart = list(
    backgroundColor = "#f9f9f9",
    spacingTop = 30,
    marginRight = 40,
    spacingRight = 30,
    marginBottom = 80,
    spacingBottom = 30,
    spacingLeft = 20,
    style = list(
      fontFamily = "Roboto Condensed",
      color = "#000000"
    )
  ),
  title = list(
    align = "left",
    x = 35,
    style = list(
      fontFamily = "Roboto Condensed",
      fontWeight = "bold",
      fontSize = "22px"
    )
  ),
  subtitle = list(
    align = "left",
    x = 35,
    margin = 10,
    style = list(
      fontFamily = "Roboto Condensed",
      fontWeight = "light",
      fontSize = "16px"
    )
  ),
  legend = list(
    align = "left",
    floating = "true",
    verticalAlign = "bottom",
    x = 15,
    y = 10,
    itemStyle = list(
      fontSize = "10px",
      fontWeight = "bold"
    )
  ),
  xAxis = list(
    gridLineColor = "#cccccc",
    gridLineWidth =  0.5,
    minorGridLineColor = "transparent",
    minoGridLineWidth =  0.5,
    tickColor = "#f9f9f9",
    tickLength = 0,
    minorTickColor = "#f9f9f9",
    lineColor = "transparent",
    labels = list(
      align = "right"
    ),
    title = list(
      enabled = TRUE,
      align = "high",
      style = list(
        fontFamily = "Roboto Condensed",
        fontSize = "14px",
        color = "#4a4a4a"
      )
    )
  ),
  yAxis = list(
    gridLineColor = "#cccccc",
    gridLineWidth =  0.5,
    minorGridLineColor = "transparent",
    minoGridLineWidth =  0.5,
    tickColor = "#f9f9f9",
    tickLength = 0,
    minorTickColor = "#f9f9f9",
    lineColor = "transparent",
    labels = list(
      align = "right"
    ),
    title = list(
      enabled = TRUE,
      align = "high",
      style = list(
        fontFamily = "Roboto Condensed",
        fontSize = "14px",
        color = "#4a4a4a"
      )
    )
  ),
  tooltip = list(
    backgroundColor = "#ececec"
  ),
  credits = list(
    enabled = TRUE,
    position = list(
      x = -15,  # highcharts default: -10
      y = -10   # highchart default: -5
    ),
    style = list(
      fontFamily = "Roboto Condensed",
      fontSize = "10px",
      color = "#4a4a4a",
      fontWeight = "light"
    ),
    scatter = list(
      allowPointSelect = TRUE
    )
  )
)

# use theme ---------------------------------------------------------------
hc %>%
  hc_add_theme(hrbrish)

