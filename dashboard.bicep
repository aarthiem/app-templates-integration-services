@description('Name of the resource group that contains the resources used')
param ResourceGroup string

@metadata(
  { Description: 'Resource name that Azure portal uses for the dashboard' }
)
param dashboardName string = 'IntegrationDashboard'

@description('Name of the dashboard to display in Azure portal')
// Remove the unused parameters
// param dashboardDisplayName string = 'Integration Dashboard'
// param location string = resourceGroup().location

var subscriptionId = subscription().subscriptionId
// Remove the unused variable
// var resourceGroup = resourceGroup().name
var resourceGroupName = resourceGroup().name
var appInsightsWorkspaceId = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/microsoft.insights/components/{resourceName}?api-version=2015-05-01'
var appInsightsWorkspace = reference(appInsightsWorkspaceId)
var appInsightsWorkspaceName = appInsightsWorkspace.name

resource Integration_Dash 'Microsoft.Portal/dashboards@2015-08-01-preview' = {
  name: 'Integration Dash'
  location: 'eastus2' 
  tags: {
    'hidden-title': 'Integration Dash'
  }
  properties: {
    lenses: {
      '0': {
        order: 0
        parts: {
          '0': {
            position: {
              x: 0
              y: 0
              colSpan: 12
              rowSpan: 8
            }
            metadata: {
              inputs: [
                {
                  name: 'ComponentId'
                    value: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/AppMapGalPt'
              settings: {}
              asset: {
                idInputName: 'ComponentId'
                type: 'ApplicationInsights'
              }
            }
          }
          '1': {
            position: {
              x: 12
              y: 0
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
                {
                  name: 'options'
                  value: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'availabilityResults/availabilityPercentage'
                          aggregationType: 4
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Availability'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#54A300'
                          }
                        }
                      ]
                      title: 'Availability'
                      titleKind: 2
                      visualization: {
                        chartType: 2
                        axisVisualization: {
                          y: {
                            isVisible: true
                            min: 0
                            max: 100
                          }
                          x: {
                            isVisible: true
                          }
                        }
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'availability'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'availability'
                            }
                          }
                        }
                      }
                    }
                  }
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'availabilityResults/availabilityPercentage'
                          aggregationType: 4
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Availability'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#54A300'
                          }
                        }
                      ]
                      title: 'Availability'
                      titleKind: 2
                      visualization: {
                        chartType: 2
                        axisVisualization: {
                          y: {
                            isVisible: true
                            min: 0
                            max: 100
                          }
                          x: {
                            isVisible: true
                          }
                        }
                        disablePinning: true
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'availability'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'availability'
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              filters: {
                MsPortalFx_TimeRange: {
                  model: {
                    format: 'local'
                    granularity: 'auto'
                    relative: '1440m'
                  }
                }
              }
            }
          }
          '2': {
            position: {
              x: 18
              y: 0
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
                {
                  name: 'options'
                  value: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'requests/duration'
                          aggregationType: 4
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Server response time'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#0078D4'
                          }
                        }
                      ]
                      title: 'Server response time'
                      titleKind: 2
                      visualization: {
                        chartType: 2
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'performance'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'performance'
                            }
                          }
                        }
                      }
                    }
                  }
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'requests/duration'
                          aggregationType: 4
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Server response time'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#0078D4'
                          }
                        }
                      ]
                      title: 'Server response time'
                      titleKind: 2
                      visualization: {
                        chartType: 2
                        disablePinning: true
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'performance'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'performance'
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              filters: {
                MsPortalFx_TimeRange: {
                  model: {
                    format: 'local'
                    granularity: 'auto'
                    relative: '1440m'
                  }
                }
              }
            }
          }
          '3': {
            position: {
              x: 24
              y: 0
              colSpan: 2
              rowSpan: 1
            }
            metadata: {
              inputs: []
              type: 'Extension/HubsExtension/PartType/ClockPart'
              settings: {
                content: {
                  timezoneId: 'Eastern Standard Time'
                  timeFormat: 'h:mma'
                  version: 1
                }
              }
            }
          }
          '4': {
            position: {
              x: 24
              y: 1
              colSpan: 2
              rowSpan: 1
            }
            metadata: {
              inputs: [
                {
                  name: 'ResourceId'
                  value: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                }
                {
                  name: 'SelectedRole'
                  isOptional: true
                }
                {
                  name: 'SelectedMetrics'
                  isOptional: true
                }
                {
                  name: 'SelectedDocumentStreams'
                  isOptional: true
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/QuickPulseV3ButtonPart'
              deepLink: '#@fdpo.onmicrosoft.com/resource/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspace}/quickPulse'
            }
          }
          '5': {
            position: {
              x: 24
              y: 2
              colSpan: 2
              rowSpan: 2
            }
            metadata: {
              inputs: [
                {
                  name: 'ResourceId'
                  value: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/CuratedBladeFailuresPinnedPart'
              isAdapter: true
              asset: {
                idInputName: 'ResourceId'
                type: 'ApplicationInsights'
              }
              deepLink: '#@fdpo.onmicrosoft.com/resource/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspace}/failures'
            }
          }
          '6': {
            position: {
              x: 12
              y: 4
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
                {
                  name: 'options'
                  value: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'requests/failed'
                          aggregationType: 7
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Failed requests'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#EC008C'
                          }
                        }
                      ]
                      title: 'Failed requests'
                      titleKind: 2
                      visualization: {
                        chartType: 3
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'failures'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'failures'
                            }
                          }
                        }
                      }
                    }
                  }
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'requests/failed'
                          aggregationType: 7
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Failed requests'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#EC008C'
                          }
                        }
                      ]
                      title: 'Failed requests'
                      titleKind: 2
                      visualization: {
                        chartType: 3
                        disablePinning: true
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'failures'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'failures'
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              filters: {
                MsPortalFx_TimeRange: {
                  model: {
                    format: 'local'
                    granularity: 'auto'
                    relative: '1440m'
                  }
                }
              }
            }
          }
          '7': {
            position: {
              x: 18
              y: 4
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
                {
                  name: 'options'
                  value: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'requests/count'
                          aggregationType: 7
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Server requests'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#0078D4'
                          }
                        }
                      ]
                      title: 'Server requests'
                      titleKind: 2
                      visualization: {
                        chartType: 3
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'performance'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'performance'
                            }
                          }
                        }
                      }
                    }
                  }
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                          }
                          name: 'requests/count'
                          aggregationType: 7
                          namespace: 'microsoft.insights/components'
                          metricVisualization: {
                            displayName: 'Server requests'
                            resourceDisplayName: '${appInsightsWorkspaceName}'
                            color: '#0078D4'
                          }
                        }
                      ]
                      title: 'Server requests'
                      titleKind: 2
                      visualization: {
                        chartType: 3
                        disablePinning: true
                      }
                      openBladeOnClick: {
                        openBlade: true
                        destinationBlade: {
                          bladeName: 'ResourceMenuBlade'
                          parameters: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                            menuid: 'performance'
                          }
                          extensionName: 'HubsExtension'
                          options: {
                            parameters: {
                              id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                              menuid: 'performance'
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              filters: {
                MsPortalFx_TimeRange: {
                  model: {
                    format: 'local'
                    granularity: 'auto'
                    relative: '1440m'
                  }
                }
              }
            }
          }
          '8': {
            position: {
              x: 24
              y: 4
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'ResourceId'
                  value: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                }
                {
                  name: 'ComponentId'
                  value: {
                    SubscriptionId: '${subscriptionId}'
                    ResourceGroup: ResourceGroup
                    Name: '${appInsightsWorkspaceName}'
                    LinkedApplicationType: 0
                    ResourceId: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                    ResourceType: 'microsoft.insights/components'
                    IsAzureFirst: false
                  }
                }
                {
                  name: 'TargetBlade'
                  value: 'Performance'
                }
                {
                  name: 'DataModel'
                  value: {
                    version: '1.0.0'
                    experience: 1
                    clientTypeMode: 'Server'
                    timeContext: {
                      durationMs: 86400000
                      createdTime: '2024-02-07T18:31:45.82Z'
                      isInitialTime: false
                      grain: 1
                      useDashboardTimeRange: false
                    }
                    prefix: 'let OperationIdsWithExceptionType = (excType: string) { exceptions | where timestamp > ago(1d) \n    | where tobool(iff(excType == "null", isempty(type), type == excType)) \n    | distinct operation_ParentId };\nlet OperationIdsWithFailedReqResponseCode = (respCode: string) { requests | where timestamp > ago(1d)\n    | where iff(respCode == "null", isempty(resultCode), resultCode == respCode) and success == false \n    | distinct id };\nlet OperationIdsWithFailedDependencyType = (depType: string) { dependencies | where timestamp > ago(1d)\n    | where iff(depType == "null", isempty(type), type == depType) and success == false \n    | distinct operation_ParentId };\nlet OperationIdsWithFailedDepResponseCode = (respCode: string) { dependencies | where timestamp > ago(1d)\n    | where iff(respCode == "null", isempty(resultCode), resultCode == respCode) and success == false \n    | distinct operation_ParentId };\nlet OperationIdsWithExceptionBrowser = (browser: string) { exceptions | where timestamp > ago(1d)\n    | where tobool(iff(browser == "null", isempty(client_Browser), client_Browser == browser)) \n    | distinct operation_ParentId };'
                    percentile: 1
                    grain: '5m'
                    selectedOperation: null
                    selectedOperationName: null
                    filters: []
                  }
                  isOptional: true
                }
                {
                  name: 'Version'
                  value: '1.0'
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/PerformanceCuratedPinnedChartPart'
              asset: {
                idInputName: 'ResourceId'
                type: 'ApplicationInsights'
              }
            }
          }
          '9': {
            position: {
              x: 0
              y: 8
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Web/sites/func-ccmvsy'
                          }
                          name: 'Http2xx'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Http 2xx'
                            resourceDisplayName: 'func-ccmvsy'
                          }
                        }
                      ]
                      title: 'Sum Http 2xx for func-ccmvsy'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          '10': {
            position: {
              x: 6
              y: 8
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Web/sites/func-ccmvsy'
                          }
                          name: 'Http5xx'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Http Server Errors'
                            resourceDisplayName: 'func-ccmvsy'
                          }
                        }
                      ]
                      title: 'Sum Http Server Errors for func-ccmvsy'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          '11': {
            position: {
              x: 12
              y: 8
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Web/sites/func-ccmvsy'
                          }
                          name: 'Http4xx'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Http 4xx'
                            resourceDisplayName: 'func-ccmvsy'
                          }
                        }
                      ]
                      title: 'Sum Http 4xx for func-ccmvsy'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          '12': {
            position: {
              x: 18
              y: 8
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Web/sites/func-ccmvsy'
                          }
                          name: 'HttpResponseTime'
                          aggregationType: 3
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Response Time'
                            resourceDisplayName: 'func-ccmvsy'
                          }
                        }
                      ]
                      title: 'Max Response Time for func-ccmvsy'
                      titleKind: 1
                      visualization: {
                        chartType: 3
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          '13': {
            position: {
              x: 0
              y: 12
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'ComponentId'
                  value: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Insights/components/${appInsightsWorkspaceName}'
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/AllWebTestsResponseTimeFullGalleryAdapterPart'
              isAdapter: true
              asset: {
                idInputName: 'ComponentId'
                type: 'ApplicationInsights'
              }
            }
          }
          '14': {
            position: {
              x: 6
              y: 12
              colSpan: 8
              rowSpan: 6
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Web/sites/logicapp-ccmvsy'
                          }
                          name: 'AppConnections'
                          aggregationType: 4
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Connections'
                            resourceDisplayName: 'logicapp-ccmvsy'
                          }
                        }
                      ]
                      title: 'Avg Connections for logicapp-ccmvsy'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          '15': {
            position: {
              x: 14
              y: 12
              colSpan: 10
              rowSpan: 6
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: '/subscriptions/${subscriptionId}/resourceGroups/${ResourceGroup}/providers/Microsoft.Web/sites/func-ccmvsy'
                          }
                          name: 'AppConnections'
                          aggregationType: 4
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Connections'
                            resourceDisplayName: 'func-ccmvsy'
                          }
                        }
                      ]
                      title: 'Avg Connections for func-ccmvsy'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    metadata: {
      model: {
        timeRange: {
          value: {
            relative: {
              duration: 24
              timeUnit: 1
            }
          }
          type: 'MsPortalFx.Composition.Configuration.ValueTypes.TimeRange'
        }
        filterLocale: {
          value: 'en-us'
        }
        filters: {
          value: {
            MsPortalFx_TimeRange: {
              model: {
                format: 'utc'
                granularity: 'auto'
                relative: '48h'
              }
              displayCache: {
                name: 'UTC Time'
                value: 'Past 48 hours'
              }
              filteredPartIds: [
                'StartboardPart-UnboundPart-fb8241be-ad77-401e-a7ce-6f1fe5cd339d'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c97ced'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c97ae6'
                'StartboardPart-MonitorChartPart-d82ceb95-1760-4ca7-84df-9ef9cf73b0fd'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c97ef1'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c97494'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c971d2'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c971de'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c974ac'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c974b8'
                'StartboardPart-MonitorChartPart-fb8241be-ad77-401e-a7ce-6f1fe5cd38fa'
              ]
            }
            Instance: {
              model: {
                operator: 'equals'
                selectAllState: 'all'
              }
              displayCache: {
                name: 'Instance'
                value: 'all'
              }
              filteredPartIds: [
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c97494'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c971d2'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c971de'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c974ac'
                'StartboardPart-MonitorChartPart-be9f144a-4db6-4211-acfa-34a493c974b8'
                'StartboardPart-MonitorChartPart-fb8241be-ad77-401e-a7ce-6f1fe5cd38fa'
              ]
            }
          }
        }
      }
    }
  }
}
