

require 'json'
require 'open-uri'
require 'fusioncharts-rails'

class FirstChart
def self.getChart

# Declare local variables for consuming schema and data information.
#Fetch data and schema information from remote url and store these in local schema and data variables.

data = open('..PATH/data.json') {
    | f | f.read
}
schema = open('..PATH/schema.json') {
    | f | f.read
}

# Create and initialize FusionTable object instance with the constructor parameters of data and schema.
fusionTable = Fusioncharts::FusionTable.new(schema, data)

# Create and initialize TimeSeries object instance with the constructor parameters of FusionTable object instance.
timeSeries = Fusioncharts::TimeSeries.new(fusionTable)

# Wrapper constructor parameters# width: Width of the chart, #height: Height of the chart, #type: ChartType, #renderAt: Id of the container where the chart will be rendered, #dataFormat: format of the data, this wrapper for timeseries chart type supports only json format, #timeSeries: Accepts only TimeSeries class object instance

# Chart rendering
chart = Fusioncharts::Chart.new({
  width: "700",
  height: "400",
  type: "timeseries",
  renderAt: "chartContainer",
  dataFormat: 'json',
  timeSeries: timeSeries
})

end
end