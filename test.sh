#! /bin/bash

conftest test --policy ci/conftest/ manifests/
yamllint manifests/ -d ci/yamllint/conf.yaml
yamllint demo-chart/templates/ -d ci/yamllint/conf.yaml
ct lint --lint-conf ci/chart-testing/lintconf.yaml --chart-yaml-schema ci/chart-testing/chart_schema.yaml