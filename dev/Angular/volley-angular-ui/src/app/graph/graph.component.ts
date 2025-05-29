import { Component, ViewChild } from '@angular/core';

import {
  ApexAxisChartSeries,
  ApexChart,
  ChartComponent,
  ApexDataLabels,
  ApexXAxis,
  ApexPlotOptions,
  ApexStroke,
  NgApexchartsModule,
} from 'ng-apexcharts';

export interface ChartOptions {
  series: ApexAxisChartSeries;
  chart: ApexChart;
  dataLabels: ApexDataLabels;
  plotOptions: ApexPlotOptions;
  yaxis: ApexYAxis;
  xaxis: ApexXAxis;
  fill: ApexFill;
  tooltip: ApexTooltip;
  stroke: ApexStroke;
  legend: ApexLegend;
}

@Component({
  selector: 'app-graph',
  imports: [NgApexchartsModule],
  templateUrl: './graph.component.html',
  styleUrl: './graph.component.scss',
})
export class GraphComponent {
  @ViewChild('chart') chart!: ChartComponent;
  public chartOptions: Partial<ChartOptions>;

  constructor() {
    this.chartOptions = {
      series: [
        {
          name: 'Set 1',
          data: [
            28, 11, 15, 13, 14, 24, 25, 23, 15, 25, 25, 16, 13, 8, 17, 25, 18,
            29, 0,
          ],
        },
        {
          name: 'Set 2',
          data: [
            10, 20, 12, 20, 14, 18, 25, 13, 20, 16, 19, 21, 12, 18, 12, 25, 23,
            14, 0,
          ],
        },
        {
          name: 'Set 3',
          data: [4, 0, 0, 0, 0, 0, 0, 0, 0, 11, 15, 0, 0, 0, 0, 0, 0, 12, 0],
        },
      ],
      chart: {
        type: 'bar',
        height: 600,
      },
      plotOptions: {
        bar: {
          horizontal: false,
          columnWidth: '55%',
        },
      },
      dataLabels: {
        enabled: false,
      },
      stroke: {
        show: true,
        width: 2,
        colors: ['transparent'],
      },
      xaxis: {
        categories: [
          '1 - PLEBES DEL RANCHO',
          '2 - PECHOCHOS',
          '3 - PANTERAS MIX',
          '4 - DESTRUCTORES',
          '4 - RENCOROSOS',
          '6 - HALCONES',
          '6 - GUERREROS',
          '6 - SPIKERS',
          '7 - TWINS MIX',
          '7 - DRAGONES',
          '7 - FENIX',
          '8 - WINNERS',
          '8 - MIXTICOS',
          '9 - TITANES',
          '10 - DESTRUCTORES',
          '10 - GUERREROS',
          '11 - PECHOCHOS',
          '11 - PLEBES DEL RANCHO',
          '11 - DRAGONES',
        ],
      },
      yaxis: {
        title: {
          text: '$ (thousands)',
        },
      },
      fill: {
        opacity: 1,
      },
      tooltip: {
        y: {
          formatter: function (val) {
            return '$ ' + val + ' thousands';
          },
        },
      },
    };
  }
}
